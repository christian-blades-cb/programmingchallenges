require_relative 'deck'
require_relative 'hand'

class Game
  attr_reader :number_of_decks

  def initialize(number_of_decks)
    @number_of_decks = number_of_decks
    deal
  end

  def hands
    @hands
  end

  def deal
    deck = Deck.new number_of_decks
    deck.shuffle!
    @hands = []
    while deck.cards.length >= 2 do
      @hands << Hand.new([deck.pop, deck.pop])
    end
  end
end

puts 'How many decks?'
decks_to_use = gets.to_i

game = Game.new(decks_to_use)
blackjacks = game.hands.select { |hand| hand.blackjack? }.size
percent = blackjacks/game.hands.count.to_f * 100

puts "Using #{decks_to_use} decks, I dealt #{game.hands.count} hands, #{blackjacks} of them were blackjacks (#{percent.round}%)."

