# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blackjack/version'

Gem::Specification.new do |spec|
  spec.name          = "blackjack"
  spec.version       = Blackjack::VERSION
  spec.authors       = ["Brandon Mills"]
  spec.email         = ["brandon.mills@careerbuilder.com"]
  spec.summary       = %q{Program to Calculate the probability of BlackJacks}
  spec.description   = %q{Calculates the probablility of getting a Black Jack given the number of decks to us}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
