require 'spec_helper'

describe BlackJack::Game do
  describe :initialize do
    it "should assign a dealer" do
      target = BlackJack::Game.new(1)
      expect(target.dealer).not_to be_nil
    end
  end

  describe :play_until_no_cards_left do
    it "should calculate percentage of blackjacks" do
      target = BlackJack::Game.new(1)
      target.dealer.stub(:hands_played).and_return(26)
      target.dealer.stub(:blackjacks).and_return(4)

      expected_message = "After 26 hands, there were 4 black jacks at 15.384615384615385%"
      target.should_receive(:puts).with(expected_message)
      target.play_until_no_cards_left
    end
  end
end
