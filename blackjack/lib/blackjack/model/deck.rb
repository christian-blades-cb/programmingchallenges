require_relative './card'
require_relative 'facecard'
require_relative 'acecard'

class Deck

  attr_reader :num_decks, :deck, :suite

  def initialize (num_decks)
    @num_decks = num_decks
    @deck = Array.new
    @suite = %w['Spade' 'Hearts' 'Clubs' 'Diamonds']
    @current_location = 0
    
    build_deck

    shuffle_deck
  end

  def build_deck

    1..num_decks.times do |deck_num|
      suite.each { |s|
        (2..10).each {|i| deck << Card.new(s, i)}
        deck << FaceCard.new(s, 'J')
        deck << FaceCard.new(s, 'Q')
        deck << FaceCard.new(s, 'K')
        deck << AceCard.new(s, 'A')
        }
    end
  end
  
  def shuffle_deck
    deck.shuffle!
  end

  def deal
    unless deck.size == 0
      deck.shift
    end
  end
end
