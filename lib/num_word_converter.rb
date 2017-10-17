require "num_word_converter/version"
require "num_word_converter/english_dictionaries"

module Converter
  class EnglishNumber

    @@specials = English::SPECIALS
    @@tens = English::TENS

    def initialize(value)
      @value = value
    end

    def get_specials(val)
      @@specials[val] ? @@specials[val] : ""
    end

    def get_tens(val)
      @@tens[val] ? @@tens[val] : ""
    end

    def get_six_digits(value)
      result = ""
      remainder = value % 1000
      thousands = (value - remainder) / 1000
      result += "#{main(thousands)} thousand"
      result += " #{main(remainder)}" unless remainder == 0
      return result
    end

    def get_three_digits(value)
      result = ""
      remainder = value % 100
      hundreds = (value - remainder) / 100
      result += "#{main(hundreds)} hundred"
      result += " #{main(remainder)}" unless remainder == 0
      return result
    end

    def get_two_digits(value)
      return @@specials[value] if @@specials[value]

      result = ""
      remainder = value % 10
      tens = (value - remainder) / 10
      result += @@tens[tens]
      result += "-#{@@specials[remainder]}" unless remainder == 0
      return result
    end

    def main(value)
      sign = ""

      # remove decimals
      value > 0 ? value = value.floor : value = value.ceil

      # add "negative" prefix for anything < 0
      if value < 0
        sign = "negative "
        value = value.abs
      end

      # return numbers from 1-19 with simple lookup
      return sign + @@specials[value] if @@specials[value]

      if value >= 1000
        return sign + get_six_digits(value)
      elsif value >= 100
        return sign + get_three_digits(value)
      else
        return sign + get_two_digits(value)
      end
    end

    def in_english
      main(@value)
    end

  end
end
