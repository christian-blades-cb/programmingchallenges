require 'blackjack/cards'

module BlackJack
  class Dealer
    attr_reader :hands_played
    attr_reader :blackjacks

    def initialize(number_of_decks)
      @decks = []
      number_of_decks.times { 
        current_deck = BlackJack::Cards::Deck.new
        current_deck.shuffle
        @decks << current_deck
      }

      @cards = []
      @decks.each { |deck| deck.cards.each { |card| @cards << card } }
      @cards.shuffle!

      @hands_played = 0
      @blackjacks = 0
    end

    def deal_hand()
      hand = []
      2.times { 
        add_next_card_to_hand(hand)
      }
      @hands_played += 1
      hand
    end
    
    def hit_me(current_hand)
      add_next_card_to_hand(current_hand)
    end

    def has_cards?()
      @cards.length > 0
    end

    def has_blackjack?(current_hand)
      total = 0
      current_hand.each { |card| card.values.each { |value| total += value } }

      if total == 21
        current_hand.each { |card| card.keys.each { |key| print key + ', ' } }
        puts "BLACK JACK!"

        @blackjacks += 1
        true
      else
        false
      end
    end
    
    private
    def add_next_card_to_hand(current_hand)
      card = @cards.shift
      card.add_value_to(current_hand) unless card.nil?
    end
  end
end
