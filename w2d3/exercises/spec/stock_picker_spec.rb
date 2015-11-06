require 'rspec'
require 'stock_picker'

describe Array do
  describe "#stock_picker" do
    let(:stocks) { [200, 10, 40, 30, 50, 20, 60] }

    it "picks the best day to buy and sell" do
      expect(stocks.stock_picker).to eq([1, 6])
    end

    it "if no profit can be had" do
      stocks = [100, 90, 70, 50, 10]
      unprofitable_stocks = stocks.stock_picker
      expect(unprofitable_stocks).to be(nil)
    end
  end
end
