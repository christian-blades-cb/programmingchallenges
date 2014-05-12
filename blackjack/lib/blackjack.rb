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
        @dealer.has_blackjack?(hand)
      end

      puts "After #{@dealer.hands_played} hands, there were #{@dealer.blackjacks} at #{(@dealer.blackjacks.to_f / @dealer.hands_played.to_f) * 100}%"
    end
  end
end
