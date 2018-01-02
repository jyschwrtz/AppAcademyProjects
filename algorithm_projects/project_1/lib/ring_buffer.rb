require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @start_idx = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(start_idx + index)
    @store[start_idx + index]
  end

  # O(1)
  def []=(index, val)
    @store[start_idx + index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if length < 1
    @length -= 1
    @store[@length + @start_idx]
  end

  # O(1) ammortized
  def push(val)
    @length += 1
    resize! if @length > @capacity
    @store[@length - 1 + @start_idx] = val
  end

  # O(1)
  def shift
    raise "index out of bounds" if length < 1
    @length -= 1
    @start_idx += 1
    @store[@start_idx - 1]
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1
    resize! if @length > @capacity
    @start_idx -= 1
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  # def end_idx
  #   @length - 1 - (@capacity - @start_idx)
  # end

  def check_index(index)
    raise "index out of bounds" unless index < @length
  end

  def resize!
    @capacity *= 2
    old_store = @store.dup
    old_length = @length
    old_start_idx = @start_idx
    @store = StaticArray.new(@capacity)
    @length = 0
    @start_idx = 0
    old_length.times do |i|
      el = old_store[old_start_idx + i]
      push(el)
    end
  end
end
