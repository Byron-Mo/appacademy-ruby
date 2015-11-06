class Card
  attr_reader :value, :suit

  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = [:diamond, :heart, :club, :spade]

  def initialize(id)
    @value = VALUES[id % 13]
    @suit = SUITS[id / 13]
  end

  def card_details
    [@value, @suit]
  end
end
