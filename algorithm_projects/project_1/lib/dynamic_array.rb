require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 4
    @arr = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @arr[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @arr[index] = value
  end

  # O(1)
  def pop
    @length -= 1

  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless @arr[index]
    if @arr.length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    @old_arr = @arr.dup
    @arr = StaticArray.new(@capacity)
    
  end
end
