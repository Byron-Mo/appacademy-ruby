require 'rspec'
require 'player'

describe Player do
  subject(:player1) { Player.new }
  let(:hand) { player1.hand }

  describe '#discard' do
    dup_hand = hand.dup

    it "discards the correct card" do
      card = hand(0)
      player1.discard(0)
      expect(hand).does not include(card)
    end
  end

  describe '#fold' do

  end

  describe '#see' do

  end

  describe '#raise' do

  end
end
