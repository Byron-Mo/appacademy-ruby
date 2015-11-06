require 'rspec'
require 'hand'

describe Hand do
  let(:straight_flush) { Hand.new }
  let(:four_of_a_kind) { Hand.new }
  let(:fullhouse) { Hand.new }
  let(:flush) { Hand.new }
  let(:straight) { Hand.new }
  let(:three_of_kind) { Hand.new }
  let(:two_pair) { Hand.new }
  let(:pair) { Hand.new }
  let(:high_card) { Hand.new }

  values = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  symbols = [:diamond, :heart, :club, :spade]

  cards = []
  symbols.each do |symbol|
    values.each do |value|
      cards << [value, symbol]
    end
  end

  it "straight flush beats four of a kind" do
    straight_flush.hand = [cards[0], cards[1], cards[2], cards[3], cards[4]]
    four_of_a_kind.hand = [cards[3], cards[16], cards[29], cards[42], cards[12]]
    expect(straight_flush.compare(four_of_a_kind)).to eq(straight_flush)
  end

  it "four of a kind beats fullhouse" do
    four_of_a_kind.hand = [cards[3], cards[16], cards[29], cards[42], cards[12]]
    fullhouse.hand = [cards[0], cards[13], cards[26], cards[27], cards[40]]
    expect(four_of_a_kind.compare(fullhouse)).to eq(four_of_a_kind)
  end

  it "fullhouse beats flush" do
    fullhouse.hand = [cards[0], cards[13], cards[26], cards[27], cards[40]]
    flush.hand = [cards[0], cards[2], cards[4], cards[7], cards[9]]
    expect(fullhouse.compare(flush)).to eq(fullhouse)
  end

  it "compares a flush to straight" do
    flush.hand = [cards[0], cards[2], cards[4], cards[7], cards[9]]
    straight.hand = [cards[0], cards[14], cards[28], cards[29], cards[17]]
    expect(flush.compare(straight)).to eq(flush)
  end

  it "compares straight to 3 of a kind" do
    straight.hand = [cards[0], cards[14], cards[28], cards[29], cards[17]]
    three_of_kind.hand = [cards[5], cards[18], cards[31], cards[20], cards[34]]
    expect(straight.compare(three_of_kind)).to eq(straight)
  end

  it "compares 3 of a kind to 2 pair" do
    three_of_kind.hand = [cards[5], cards[18], cards[31], cards[20], cards[34]]
    two_pair.hand = [cards[12], cards[25], cards[30], cards[43], cards[2]]
    expect(three_of_kind.compare(two_pair)).to eq(three_of_kind)
  end

  it "compares 2 pair to 1 pair" do
    two_pair.hand = [cards[12], cards[25], cards[30], cards[43], cards[2]]
    pair.hand = [cards[9], cards[22], cards[24], cards[28], cards[45]]
    expect(two_pair.compare(pair)).to eq(two_pair)
  end

  it "compares pair to high card" do
    pair.hand = [cards[9], cards[22], cards[24], cards[28], cards[45]]
    high_card.hand = [cards[0], cards[16], cards[33], cards[40], cards[24]]
    expect(pair.compare(high_card)).to eq(pair)
  end
end
