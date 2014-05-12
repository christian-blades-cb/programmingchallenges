class Card

  attr_reader :suite, :number

  def initialize(suite, number)
    @suite = suite
    @number = number
  end

  def value
    number
  end
  
end
