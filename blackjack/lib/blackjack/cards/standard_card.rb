module BlackJack
  module Cards
    class StandardCard < Card
      
      def initialize(card_arguments)
        @face_value = card_arguments[:value]
        @suite = card_arguments[:suite]
        @value = card_arguments[:value].to_i
      end
    end
  end
end
