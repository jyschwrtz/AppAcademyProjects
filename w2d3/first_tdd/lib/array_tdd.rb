class Array
  def remove_dups
    self.uniq
  end

  def two_sums
    result = []
    self.each_index do |first|
      self.each_index do |second|
        next if first >= second
        if self[first] + self[second] == 0
          result.push([first, second])
        end
      end
    end
    result
  end

  def my_transpose
    self.transpose
  end

  def stock_picker
    return [] if self.empty? || self.is_descending?

    best_profit = 0
    best_days = [0, 1]
    self.each_index do |buy|
      self.each_index do |sell|
        next if buy >= sell
        curr_profit = self[sell] - self[buy]
        if curr_profit > best_profit
          best_profit = curr_profit
          best_days = [buy, sell]
        end
      end
    end
    best_days
  end

  # private

  def is_descending?
    self.each_index do |i|
      next if i == self.length - 1
      j = i + 1
      return false if self[i] < self[j]
    end
    true
  end
end
