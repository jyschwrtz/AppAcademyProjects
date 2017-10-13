require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count, :store, :map
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      val = @map[key]
      update_node!([key, val])
    else
      val = calc!(key)
      @map[key] = val
      @store.append(key, val)
      eject! if @map.count > @max
    end
    val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @prc.call(key)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    key, val = node
    @store.remove(key)
    @store.append(key, val)
  end

  def eject!
    key = @store.first.key
    @store.remove(key)
    @map.delete(key)
  end
end
