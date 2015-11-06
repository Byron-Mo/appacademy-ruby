class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def beat?(other_hand)
    hand_type >= other_hand.hand_type
  end

  def compare(other_hand)
    beat?(other_hand) ? self : other_hand
  end

  def hand_type
    hand_types = [
      straight_flush?, four_of_kind?, fullhouse?,
      flush?, straight?, three_of_kind?,
      two_pair?, pair?, high_card?
    ]

    hand_types.each_with_index do |check, idx|
      return 9 - idx if check == true
    end
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_kind?
    cards = Hash.new(0)
    self.hand.each do |card|
      cards[card[0]] += 1
    end
    cards.values.include?(4)
  end

  def fullhouse?
    cards = Hash.new(0)
    self.hand.each do |card|
      cards[card[0]] += 1
    end
    cards.keys.count == 2
  end

  def flush?
    current_suit = self.hand[0][1]
    self.hand.each do |card|
      return false if current_suit != card[1]
    end
    true
  end

  def straight?
    values = %w(2 3 4 5 6 7 8 9 10 J Q K A)

    cards_values = self.hand.map do |card|
      values.find_index(card[0])
    end
    cards_values.sort!
    cards_values == (cards_values.first..cards_values.last).to_a
  end

  def three_of_kind?
    cards = Hash.new(0)
    self.hand.each do |card|
      cards[card[0]] += 1
    end
    cards.values.include?(3)
  end

  def two_pair?
    cards = Hash.new(0)
    self.hand.each do |card|
      cards[card[0]] += 1
    end
    cards.values.count(2) == 2
  end

  def pair?
    cards = Hash.new(0)
    self.hand.each do |card|
      cards[card[0]] += 1
    end
    cards.values.count(2) == 1
  end

  def high_card?
    true
  end
end
