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

    pivot = array[start]

    # array[]

  end

  def self.partition(array, start, length, &prc)

  end
end
