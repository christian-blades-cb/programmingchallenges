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
      while @dealer.has_cards
        hand = @dealer.deal_hand
        @dealer.has_blackjack?(hand)
      end

      puts "After #{@dealer.hands_played}, there were #{@dealer.blackjacks} at #{(@dealer.blackjacks/@dealer.hands_played) * 100}%"
    end
  end
end
