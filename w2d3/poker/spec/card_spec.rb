require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(0) }
  let(:value) { card.value }
  let(:suit) { card.suit }

  it "card is apart of Card class" do
    expect(card).to be_an_instance_of(Card)
  end

  it "verifies the card" do
    expect(value).to eq('2')
    expect(suit).to eq(:diamond)
  end

  it "verifies another card" do
    card = Card.new(50)
    expect(card.value).to eq('K')
    expect(card.suit).to eq(:spade)
  end

  it "gets a card" do
    expect(card.card_details).to eq(['2', :diamond])
  end
end
