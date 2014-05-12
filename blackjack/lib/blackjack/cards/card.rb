module BlackJack
  module Cards
    class Card
      attr_reader :face_value
      attr_reader :suite
      attr_reader :value

      def add_value_to(values)   
        values << { @face_value.to_s + ' ' + @suite.keys[0].to_s => @value }
      end

      def ==(other_object)
        if @face_value == other_object.face_value &&
           @suite == other_object.suite &&
           @value == other_object.value
          true
        else
          false
        end
      end
    end
  end
end
