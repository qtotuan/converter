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

    def in_english
      string = ""

      # remove decimals
      @value > 0 ? @value = @value.floor : @value = @value.ceil

      # add "negative" prefix for anything < 0
      if @value < 0
        string = "negative "
        @value = @value.abs
      end

      # return numbers from 1-19 with simple lookup
      if @@specials[@value]
        return string + @@specials[@value]
      end

      # return nil for numbers > 99
      if @value/10 >= 10
        return nil
      end

      # for full tens, like 30
      string = string + get_tens((@value/10).floor)

      # for tens with remainder, like 32
      if @value % 10 > 0
        string = string + "-" + get_specials((@value % 10).floor)
      end

      return string
    end
  end
end
