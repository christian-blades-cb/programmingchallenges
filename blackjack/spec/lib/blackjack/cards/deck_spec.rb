require "spec_helper"

describe BlackJack::Cards::Deck do
  before(:each) do
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

  describe :instantiate do
    it "should have a list of suites" do
      target = BlackJack::Cards::Deck.new
      expect(target.suites).to eq(@suites)
    end

    it "should have a list of card values" do
      target = BlackJack::Cards::Deck.new
      expect(target.card_values).to eq(@card_values)
    end

    it "should produce a deck of cards with a suite and value" do
      target = BlackJack::Cards::Deck.new
      expect(target.cards).to eq(@cards)
    end
  end

  describe :shuffle_deck do
    it "should shuffle the deck in a different order" do
      target = BlackJack::Cards::Deck.new    
      target.shuffle
      expect(target.cards).not_to eq(@cards)
    end
  end
end
