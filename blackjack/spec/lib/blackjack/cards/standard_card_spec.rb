require 'spec_helper'

describe BlackJack::Cards::StandardCard do
  describe :initialize do
    it "should take the value of the card and us it as the cards value" do
      target = BlackJack::Cards::StandardCard.new({ value: "1", suite: { H: "Hearts" } })
      
      expect(target.face_value).to eq("1")
      expect(target.suite).to eq({ H: "Hearts" })
      expect(target.value).to eq(1)
    end
  end

  describe :add_value_to do
    it "should add the given card value to the array" do
      values = []
      expected_values = [{ "1 of Hearts" => 1 }]
      target = BlackJack::Cards::StandardCard.new({ value: "1", suite: { H: "Hearts" } })
    
      expect(target.add_value_to(values)).to eq(expected_values)
    end
  end
end
