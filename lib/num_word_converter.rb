require "num_word_converter/version"
require "num_word_converter/english_dictionaries"


module Converter
  class EnglishNumber

    @@singles = English::SINGLES
    @@teens = English::TEENS
    @@tens = English::TENS

    def initialize(value)
      @value = value
    end

    def get_singles(val)
      @@singles[val] ? @@singles[val] : ""
    end

    def get_teens(val)
      @@teens[val] ? @@teens[val] : ""
    end

    def get_tens(val)
      @@tens[val] ? @@tens[val] : ""
    end

    def in_english
      string = ""



      if @value === 0
        return "zero"
      end

      if @value < 0
        string = "negative "
        @value = @value.abs
      end

      if @value < 10
        return string + get_singles(@value)
      end

      if @value > 10 && @value < 20
        return string + get_teens(@value)
      end

      if @value/10 >= 10
        return nil
      end

      string = string + get_tens((@value/10).abs.floor)

      if @value % 10 > 0
        string = string + "-" + get_singles((@value % 10).abs.floor)
      end

      return string

    end

  end
end
