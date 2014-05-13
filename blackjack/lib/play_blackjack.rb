#!/usr/bin/env ruby
require_relative 'blackjack/blackjack'
require 'thor'

class PlayBlackJackCLI < Thor

  desc "play NUM_DECKS", "play blackjack with NUM_DECKS"
  def play(num_decks)

    if num_decks.to_i  < 1
      puts "Number of decks must be greater than 0"
      return
    end
    
    blackjack = Blackjack.new(num_decks.to_i)

    blackjack.play
    blackjack.compute
  end
  
end
