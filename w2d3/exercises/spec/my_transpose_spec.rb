require 'rspec'
require 'my_transpose'

describe Array do
  describe '#my_transpose' do
    it "transposes the matrix" do
      matrix = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
      transposed = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
      expect(matrix.my_transpose).to eq(transposed)
    end

    it "transposes rectangular matrices" do
      matrix = [[0, 1], [3, 4], [6, 7]]
      transposed = [[0, 3, 6], [1, 4, 7]]
      expect(matrix.my_transpose).to eq(transposed)
    end

    it "does't change original matrix" do
      matrix = [[0, 1], [3, 4], [6, 7]]
      check_matrix = matrix.dup
      matrix.my_transpose
      expect(matrix).to eq(check_matrix)
    end

    # it "transposes array" do
    #   array = [1, 2, 3]
    #   transposed = [[1], [2], [3]]
    #   expect(array.my_transpose).to eq(transposed)
    # end
  end
end
