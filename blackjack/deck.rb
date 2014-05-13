require_relative 'card'

class Deck
  attr_reader :cards
  def initialize(count = 1)
    @cards = []
    count.times do
      Card.FACES.each do |face|
        Card.SUITS.each do |suit|
          @cards.push(Card.new( {face: face, suit: suit } ))
        end
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def pop
    @cards.pop
  end
end

puts Deck.new