require "converter/version"

module Converter
  class EnglishNumber

    @@singles = {
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten"
    }

    @@teens = {
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
    }

    @@tens = {
      1 => "ten",
      2 => "twenty",
      3 => "thirty",
      4 => "fourty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }

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
