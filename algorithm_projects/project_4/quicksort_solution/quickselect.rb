class Array

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    end_idx = start + length - 1
    pivot = array[start]
    count = 0
    array[(start + 1)..end_idx].each_with_index do |el, idx|
      if prc.call(pivot, el) == 1
        count += 1
        current_idx = idx + start + 1
        array[current_idx], array[start + count] =
          array[start + count], array[current_idx]
      end
    end
    array[start], array[start + count] = array[start + count], array[start]
    count + start
  end

  def select_kth_smallest(k)
    prc ||= Proc.new { |x, y| x <=> y }
    pivot_val = self[0]
    pivot_idx = Array.partition(self, 0, self.length, &prc)

    until pivot_idx + 1 == k
      if pivot_idx + 1 > k
        pivot_idx = Array.partition(self, 0, pivot_idx, &prc)
      elsif pivot_idx + 1 < k
        pivot_idx = Array.partition(self, pivot_idx + 1, self.length - pivot_idx - 1, &prc)
      else
        break
      end
    end

    self[pivot_idx]
  end
end

arr = [1,4,2,5,3,5]  # [1,2,3,4,5,5]
p arr.select_kth_smallest(1) # 1
p arr.select_kth_smallest(2) # 2
p arr.select_kth_smallest(3) # 3
p arr.select_kth_smallest(4) # 4
p arr.select_kth_smallest(5) # 5
p arr.select_kth_smallest(6) # 5
