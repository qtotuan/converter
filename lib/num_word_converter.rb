require "num_word_converter/version"
require "num_word_converter/english_dictionaries"

module Converter
  class EnglishNumber

    @@specials = English::SPECIALS
    @@tens = English::TENS

    def initialize(value)
      @value = value
    end

    def make_words(value, divider, title)
      result = ""
      remainder = value % divider
      num = (value - remainder) / divider
      result += "#{main(num)} " + title
      result += " #{main(remainder)}" unless remainder == 0
      return result
    end

    def get_tens(value)
      return @@specials[value] if @@specials[value]

      result = ""
      remainder = value % 10
      tens = (value - remainder) / 10
      result += @@tens[tens]
      result += "-#{@@specials[remainder]}" unless remainder == 0
      return result
    end

    def main(value)
      prefix = ""

      # remove decimals
      value > 0 ? value = value.floor : value = value.ceil

      # add "negative" prefix for anything < 0
      if value < 0
        prefix = "negative "
        value = value.abs
      end

      # return numbers from 1-19 with simple lookup
      return prefix + @@specials[value] if @@specials[value]

      if value >= 1000000000
        return prefix + make_words(value, 1000000000, "billion")
      elsif value >= 1000000
        return prefix + make_words(value, 1000000, "million")
      elsif value >= 1000
        return prefix + make_words(value, 1000, "thousand")
      elsif value >= 100
        return prefix + make_words(value, 100, "hundred")
      else
        return prefix + get_tens(value)
      end
    end

    def in_english
      main(@value)
    end

  end
end
