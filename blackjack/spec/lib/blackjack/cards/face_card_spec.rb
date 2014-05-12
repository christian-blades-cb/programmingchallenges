require 'spec_helper'

describe BlackJack::Cards::FaceCard do
  describe :initialize do
    it "should take the value of the card and us it as the cards value" do
      target = BlackJack::Cards::FaceCard.new({ value: "K", suite: { H: "Hearts" } })
      
      expect(target.face_value).to eq("K")
      expect(target.suite).to eq({ H: "Hearts" })
      expect(target.value).to eq(10)
    end
  end

  describe :add_value_to do
    it "should add the given card value to the array" do
      values = []
      expected_values = [{ "K H" => 10 }]
      target = BlackJack::Cards::FaceCard.new({ value: "K", suite: { H: "Hearts" } })
    
      expect(target.add_value_to(values)).to eq(expected_values)
    end
  end
end
