module BlackJack
  module Cards
    class Deck
      attr_reader :suites
      attr_reader :card_values
      attr_reader :cards

      def initialize
        @suites = { H: "Hearts", D: "Diamonds", S: "Spades", C: "Clubs" }
        @card_values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        @cards = @card_values.product(@suites.to_a).map { |value, suite|
          if ["Ace"].include?(value)
            BlackJack::Cards::AceCard.new({ value: value, suite: Hash[*suite] })
          elsif ["J","K","Q"].include?(value)
            BlackJack::Cards::FaceCard.new({ value: value, suite: Hash[*suite] })
          else
            BlackJack::Cards::StandardCard.new({ value: value, suite: Hash[*suite] })
          end
        }
      end

      def shuffle
        @cards.shuffle!
      end
    end
  end
end
