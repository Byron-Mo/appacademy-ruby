class Array
  def two_sum
    results = []
    idx = 0
    while idx < count - 1
      jdx = idx + 1
      while jdx < count
        results << [idx, jdx] if self[idx] + self[jdx] == 0
        jdx += 1
      end
      idx += 1
    end
    results.empty? ? nil : results
  end
end
