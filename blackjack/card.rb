class Card
  attr_reader :suit, :face

  def self.FACES
    [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king]
  end

  def self.SUITS
    [:clubs, :diamonds, :hearts, :spades]
  end

  def initialize(args)
    @suit = args[:suit]
    @face = args[:face]
  end

  def to_s
    face.to_s + ' of ' + suit.to_s
  end
end