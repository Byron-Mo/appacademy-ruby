require 'rspec'
require 'my_uniq'

describe Array do
  describe '#my_uniq' do
    let(:array) { [1, 2, 3, 2, 4, 5, 3] }

    it "removes duplicates" do
      expect(array.my_uniq).to eq([1, 2, 3, 4, 5])
    end

    it "does not call built-in #uniq method" do
      expect(array).not_to receive(:uniq)
      array.my_uniq
    end

    it "does not modify the original array" do
      check_arr = array.dup
      array.my_uniq
      expect(array).to eq(check_arr)
    end
  end
end
