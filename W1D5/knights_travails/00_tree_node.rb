class PolyTreeNode
  attr_accessor :value, :parent, :children
  def initialize(value = [0,0], parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def children
    @children
  end

  def parent=(node)
    return @parent = nil if node.nil?
    if @parent
      @parent.children.delete(self)
    end

    @parent = node
    @parent.children += [self] unless @parent.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise unless self.children.include?(child_node)
    self.children.delete(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |child|
      node = child.dfs(target_value)
      return node if node
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue.concat(current_node.children)
    end
    nil
  end






end
