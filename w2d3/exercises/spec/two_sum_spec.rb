require 'rspec'
require 'two_sum'

describe Array do
  describe "#two_sum" do
    let(:array) { [-1, 0, 2, -2, 1] }

    it "returns locations of numbers that sum up to 0" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns nil if no numbers sum up to 0" do
      array2 = [1, 2, 3, 4]
      expect(array2.two_sum).to eq(nil)
    end
  end
end
