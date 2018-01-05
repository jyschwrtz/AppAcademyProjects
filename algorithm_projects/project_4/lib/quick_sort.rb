class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length == 1
    pivot = array[0]
    left = []
    right = []

    array[1..-1].each do |el|
      if el <= pivot
        left << el
      else
        right << el
      end
    end

    self.sort1(left) + [pivot] + self.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    prc ||= Proc.new { |x, y| x <=> y }

    res_pos = self.partition(array, start, length, &prc)
    self.sort2!(array, 0, res_pos, &prc) + [array[res_pos]] + self.sort2!(array, res_pos + 1, length - res_pos, &prc)

  end

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
end
