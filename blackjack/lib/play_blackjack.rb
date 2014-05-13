#!/usr/bin/env ruby
require_relative 'blackjack/blackjack'
require 'thor'

class PlayBlackJackCLI < Thor

  desc "play NUM_DECKS", "play blackjack with NUM_DECKS"
  def play(num_decks)


    blackjack = Blackjack.new(num_decks.to_i)

    blackjack.play
    blackjack.compute
  end
  
end
