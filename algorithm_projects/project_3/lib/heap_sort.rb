require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new { |x, y| -1 * (x <=> y) }
    self.each_index do |idx|
      BinaryMinHeap.heapify_up(self, idx, idx + 1, &prc)
    end
    self.each_index do |idx|
      break if idx == self.length
      i = self[0]
      j = self[self.length - 1 - idx]
      self[0] = j
      self[self.length - 1 - idx] = i
      BinaryMinHeap.heapify_down(self, 0, self.length - 1 - idx, &prc)
    end
    self
  end
end
