# Num_Word_Converter

Translate integers into natural language English up to billions (including negative and positive prefix). Decimals are truncated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'num_word_converter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install num_word_converter

## Usage

``` ruby
Converter::EnglishNumber.new(6).in_english # "six"
Converter::EnglishNumber.new(11).in_english # "eleven"
Converter::EnglishNumber.new(22).in_english # "twenty-two"
Converter::EnglishNumber.new(24.5).in_english # "twenty-four"
Converter::EnglishNumber.new(101).in_english # nil
Converter::EnglishNumber.new(-6).in_english # "negative six"
Converter::EnglishNumber.new(-0.5).in_english # "zero"
Converter::EnglishNumber.new(415369687257).in_english # four hundred fifteen billion three hundred sixty-nine million six hundred eighty-seven thousand two hundred fifty-seven
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/num_word_converter.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
