module BlackJack
  module Cards
    class FaceCard < Card
      
      def initialize(card_arguments)
        @face_value = card_arguments[:value]
        @suite = card_arguments[:suite]
        @value = 10
      end
    end
  end
end
