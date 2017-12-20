require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if include?(num)
    if @count == num_buckets
      resize!
    end
    self[num] << num
    @count += 1
  end

  def remove(num)
    return unless include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num.hash % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    to_distribute = @store.dup
    @store = Array.new(2 * num_buckets) { Array.new }
    to_distribute.each do |bucket|
      until bucket.empty?
        self[bucket[0]] << bucket.shift
      end
    end
  end
end
