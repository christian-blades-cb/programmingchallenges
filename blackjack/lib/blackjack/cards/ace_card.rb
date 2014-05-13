module BlackJack
  module Cards
    class AceCard < Card
      def initialize(card_arguments)
        @face_value = card_arguments[:value]
        @suite = card_arguments[:suite]
        @value = 11
      end

      def add_value_to(values)
        other_aces = values.select { |card| card.keys[0].start_with?("Ace") }

        if (other_aces.length > 0)
          values.each { |card| 
            if card.keys[0].start_with?("Ace")
              card[card.keys[0]] = 1
            end
          }

          values << { @face_value.to_s + ' of ' + @suite.values[0].to_s => 1 }
        else
          super values
        end
      end
    end
  end
end
