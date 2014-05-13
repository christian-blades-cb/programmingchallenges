require_relative 'card'

class Hand
  attr_reader :cards

  CARD_VALUES = { :ace => 1,  :two => 2,  :three => 3, :four => 4,
                  :five => 5, :six => 6,  :seven => 7, :eight => 8,
                  :nine => 9, :ten => 10, :jack => 10, :queen => 10,
                  :king => 10 }

  def initialize(cards = [])
    @cards = cards
  end

  def soft_value
    cards.inject(0) { |result, card| result + CARD_VALUES[card.face] }
  end

  def value
    result = soft_value
    cards_that_are(:ace).each do
      result += 10 if result <= 11
    end
    result
  end

  def blackjack?
    (cards.length == 2) && (value == 21)
  end

  def cards_that_are(face)
    cards.select{ |card| card.face == face }
  end

  def inspect
    cards.inspect + " (#{value})"
  end
end