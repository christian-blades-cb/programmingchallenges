require 'spec_helper'

describe BlackJack::Cards::AceCard do
  describe :initialize do
    it "should take the value of the card and us it as the cards value" do
      target = BlackJack::Cards::AceCard.new({ value: "Ace", suite: { H: "Hearts" } })
      
      expect(target.face_value).to eq("Ace")
      expect(target.suite).to eq({ H: "Hearts" })
      expect(target.value).to eq(11)
    end
  end

  describe :add_value_to do
    it "should add the given card value to the array" do
      values = []
      expected_values = [{ "Ace of Hearts" => 11 }]
      target = BlackJack::Cards::AceCard.new({ value: "Ace", suite: { H: "Hearts" } })
    
      expect(target.add_value_to(values)).to eq(expected_values)
    end

    it "should add the given card with value of 1" do
      values = [{ "Ace of Spades" => 1 }]
      expected_values = [{ "Ace of Spades" => 1 }, { "Ace of Hearts" => 1 }]
      target = BlackJack::Cards::AceCard.new({ value: "Ace", suite: { H: "Hearts" } })
    
      expect(target.add_value_to(values)).to eq(expected_values)
    end

    it "should set all ace card values to 1" do
      values = [{ "Ace of Spades" => 11 }]
      expected_values = [{ "Ace of Spades" => 1 }, { "Ace of Hearts" => 1 }]
      target = BlackJack::Cards::AceCard.new({ value: "Ace", suite: { H: "Hearts" } })
    
      expect(target.add_value_to(values)).to eq(expected_values)
    end
  end
end
