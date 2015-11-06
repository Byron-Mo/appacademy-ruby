require 'rspec'
require 'deck'

describe Deck do
  subject(:poker_deck) { Deck.new }
  let(:deck) { poker_deck.deck }

  it "has 52 cards" do
    expect(deck.count).to eq(52)
  end

  it "has only cards" do
    deck.each do |card|
      expect(card).to be_instance_of(Card)
    end
  end

  it "is random" do
    deck1 = deck.map(&:value)
    deck2 = Deck.new.deck.map(&:value)

    expect(deck1).not_to eq(deck2)
  end

  describe '#draw' do
    it "can draw" do
      10.times { poker_deck.draw }
      expect(poker_deck.deck.count).to eq(42)
    end
  end
end
