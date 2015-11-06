require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  let(:game)    { TowersOfHanoi.new }
  let(:towers)  { game.towers }

  describe '#render' do
    it 'when render is called' do
      expect(game.render).to be_nil
    end
  end

  describe '#move' do
    let!(:disc) { towers[0].last }

    before(:each) do
      game.move(0, 1)
    end

    it 'pops off disc from_tower' do
      expect(towers[0]).to eq([3, 2])
    end

    it 'adds disc to_tower' do
      expect(towers[1]).to eq([1])
    end

    it "doesn't modify untouched towers" do
      expect(towers[2]).to be_empty
    end
  end

  describe '#won?' do
    it "when the game is incomplete" do
      [[0, 1], [0, 2], [1, 2], [0, 1]].each do |move|
        game.move(*move)
      end

      expect(game.won?).to be false
    end

    it 'says when won' do
      towers[0] = []
      towers[1] = []
      towers[2] = [3, 2, 1]

      expect(game.won?).to be_truthy
    end
  end
end


# 0: 3 2 1
# 1:
# 2:
