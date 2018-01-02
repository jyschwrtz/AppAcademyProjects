require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @start_pos = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if length < 1
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    resize! if @length > @capacity
    self[@length] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if length < 1
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    resize! if @length > @capacity
    self[@length] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index < @length
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    old_store = @store.dup
    @store = StaticArray.new(@capacity)
    old_store.each do |el|
      push(el)
    end
  end
end
