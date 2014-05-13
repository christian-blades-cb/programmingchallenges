require "blackjack/version"
require "blackjack/cards"
require "blackjack/dealer"

module BlackJack
  class Game
    attr_reader :dealer 

    def initialize(number_of_decks)
      @dealer = BlackJack::Dealer.new(number_of_decks)
    end

    def play_until_no_cards_left()
      hand = []
      while @dealer.has_cards?
        hand = @dealer.deal_hand
        while !@dealer.has_blackjack?(hand) && @dealer.has_cards? && calculate_hand_value(hand) < 11
          @dealer.hit_me(hand)
        end
      end

      puts "After #{@dealer.hands_played} hands, there were #{@dealer.blackjacks} black jacks at #{(@dealer.blackjacks.to_f / @dealer.hands_played.to_f) * 100}%"
    end
    
    private
    def calculate_hand_value(current_hand)
      total = 0    
      current_hand.each { |card| card.values.each { |value| total += value } }
      total
    end
  end
end
