# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'num_word_converter/version'

Gem::Specification.new do |spec|
  spec.name          = "num_word_converter"
  spec.version       = Converter::VERSION
  spec.authors       = ["qtotuan"]
  spec.email         = ["quynh.totuan@gmail.com"]

  spec.summary       = %q{A gem for converting numbers into English words (-99 to 99)}
  spec.homepage      = "https://github.com/qtotuan/num_word_converter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
