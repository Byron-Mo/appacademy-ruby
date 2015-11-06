class Array
  def my_transpose
    transposed = Array.new(self.first.size) { Array.new(self.size)}
    self.each_with_index do |row, idx|
      row.each_with_index do |el, jdx|
        transposed[jdx][idx] = el
      end
    end
    transposed
  end
end
