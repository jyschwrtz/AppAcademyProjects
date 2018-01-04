require_relative 'heap'

def k_largest_elements(array, k)
  prc = Proc.new { |x, y| -1 * (x <=> y) }
  array.each_index do |idx|
    BinaryMinHeap.heapify_up(array, idx, idx + 1, &prc)
  end
  array.each_index do |idx|
    break if idx == k
    end_index = array.length - idx - 1
    array[0], array[end_index] = array[end_index], array[0]
    BinaryMinHeap.heapify_down(array, 0, end_index, &prc)
  end
  array[-k..-1]
end
