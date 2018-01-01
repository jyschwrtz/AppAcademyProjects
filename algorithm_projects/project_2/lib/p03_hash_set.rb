require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    @count += 1
    resize! if @count > num_buckets
    self[key.hash].push(key.hash)
  end

  def include?(key)
    self[key.hash].include?(key.hash)
  end

  def remove(key)
    return nil unless include?(key)
    @count -= 1
    self[key.hash].delete(key.hash)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.each do |arr|
      arr.each do |val|
        insert(val)
      end
    end
    @count += 1
  end
end
