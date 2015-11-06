class Array
  def stock_picker
    best_days = []
    best_profit = 0
    idx = 0

    while idx < count - 1
      jdx = idx + 1
      while jdx < count
        profit = self[jdx] - self[idx]

        if profit > best_profit
          best_profit = profit
          best_days = [idx, jdx]
        end
        jdx += 1
      end
      idx += 1
    end
    best_days.empty? ? nil : best_days
  end

end
