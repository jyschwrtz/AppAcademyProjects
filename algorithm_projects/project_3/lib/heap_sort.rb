require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new { |x, y| -1 * (x <=> y) }
    puts "before first heap #{self}"
    self.each_index do |idx|
      self[0..idx] = BinaryMinHeap.heapify_up(self[0..idx], idx, &prc)
    end
    puts "after first heap #{self}"
    self.each_index do |idx|
      break if idx == self.length
      puts "before swap #{self}"
      i = self[0]
      j = self[self.length - 1 - idx]
      self[0] = j
      self[self.length - 1 - idx] = i
      puts "before heap down#{self}"
      p idx
      p self[0..(self.length - 1 - idx)]
      p BinaryMinHeap.heapify_down(self[0..(self.length - 1 - idx)], 0, &prc)
      puts "after #{self}"
    end
    self
  end
end
