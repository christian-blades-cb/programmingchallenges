require 'spec_helper'

describe BlackJack::Dealer do
  describe :initialize do
    it "should create the number of decks and shuffle them" do
      target = BlackJack::Dealer.new(2)

      expect(target.instance_variable_get(:@decks).length).to eq(2)
      expect(target.instance_variable_get(:@decks)[0].cards.length * 2).to eq(target.instance_variable_get(:@cards).length)
      expect(target.hands_played).to eq(0)
    end
  end

  describe :deal_hand do
    it "should return the top two cards of the deck and add a played hand" do
      target = BlackJack::Dealer.new(2)
      expected_dealt_hand = []
      target.instance_variable_get(:@cards)[0].add_value_to(expected_dealt_hand)
      target.instance_variable_get(:@cards)[1].add_value_to(expected_dealt_hand)

      dealt_hand = target.deal_hand

      expect(dealt_hand).to eq(expected_dealt_hand)
      expect(target.hands_played).to eq(1)
    end 
  end
end
