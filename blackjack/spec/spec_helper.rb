require 'simplecov'
SimpleCov.start

SimpleCov.start do
  add_filter '/spec/'
end

require_relative '../lib/blackjack'
