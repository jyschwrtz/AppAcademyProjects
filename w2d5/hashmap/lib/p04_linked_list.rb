class Node
  attr_accessor :key, :val, :prev, :next

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @prev = nil
    @next = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects nextious link to prev link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    old_tail = @tail.prev
    new_node = Node.new(key, val)
    @tail.prev = new_node
    old_tail.next = new_node
    new_node.prev = old_tail
    new_node.next = @tail
  end

  def update(key, val)
    each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
        old_prev = node.prev
        old_next = node.next
        old_prev.next = old_next
        old_next.prev = old_prev
      end
    end
  end

  def each
    current = first
    until  current == @tail
      yield(current)
      current = current.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
