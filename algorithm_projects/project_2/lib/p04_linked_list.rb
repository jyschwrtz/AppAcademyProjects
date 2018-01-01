class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    # self.next.prev = self.prev
    # self.prev.next = self.next
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.prev = @tail
    @tail.next = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.prev
  end

  def last
    @tail.next
  end

  def empty?
    @tail.next == @head
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    ahead = @tail.next
    behind = @tail
    ahead.prev = node
    behind.next = node
    node.prev = behind
    node.next = ahead
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
    nil
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        p node.prev.key
        p node.key
        p node.next.key
        node.prev.next = node.next
        node.next.prev = node.prev
      end
    end
  end

  def each
    current_node = @head.prev
    until current_node == @tail
      yield current_node
      current_node = current_node.prev
    end
    return self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
