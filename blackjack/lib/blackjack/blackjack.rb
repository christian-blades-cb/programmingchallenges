require_relative 'model/deck'


class Blackjack
  attr_reader :num_decks, :deck, :num_blackjacks, :num_hands
  
  def initialize(num_decks)
    @deck = Deck.new(num_decks)

    @num_decks = num_decks
    @num_blackjacks = 0
    @num_hands = 0
    
  end

  def play
    @num_hands = (52 * num_decks) / 2

    (1..num_hands).each do |hand|
      @num_blackjacks += 1 if deck.deal.value + deck.deal.value == 21
    end
  end

  def compute
    puts "After #{num_hands} hands there was #{num_blackjacks} blackjacks at" +
      " #{(num_blackjacks.to_f/num_hands.to_f) * 100}%."
  end
  
end

