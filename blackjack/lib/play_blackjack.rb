#!/usr/bin/env ruby
require_relative 'blackjack/blackjack'


blackjack = Blackjack.new(ARGV[0].to_i)
blackjack.play
blackjack.compute
