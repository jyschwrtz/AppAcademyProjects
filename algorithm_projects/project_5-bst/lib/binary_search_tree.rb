require_relative 'bst_node'
# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = BSTNode.new(value)
    else
      child_pos_placement(@root, value)
    end
  end

  def find(value, tree_node = @root)
    until tree_node == nil
      return tree_node if value == tree_node.value
      if value < tree_node.value
        tree_node = tree_node.left
      else
        tree_node = tree_node.right
      end
    end
    tree_node
  end

  def delete(value)
    node_del = find(value, @root)
    num_children = child_count(node_del)
    parent_del = node_del.parent
    if @root == node_del
      @root = nil
    elsif num_children == 0
      if parent_del.left == node_del
        parent_del.left = nil
      else
        parent_del.right = nil
      end
    elsif num_children == 1
      
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    until tree_node.right == nil
      tree_node = tree_node.right
    end
    tree_node
  end

  def depth(tree_node = @root)
    return 0 if tree_node == nil
    return 0 if child_count(tree_node) == 0
    left_side = 1 + depth(tree_node.left)
    right_side = 1 + depth(tree_node.right)
    left_side > right_side ? left_side : right_side
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node == nil
    return true if child_count(tree_node) == 0
    diff = depth(tree_node.left) - depth(tree_node.right)
    return false if diff > 1 || diff < -1
    if is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    end
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end
    arr << tree_node.value
    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end
    arr
  end


  private
  # optional helper methods go here:
  def child_pos_placement(parent_node, value)
    new_node = BSTNode.new(value)
    if value < parent_node.value
      if parent_node.left
        child_pos_placement(parent_node.left, value)
      else
        new_node.parent = parent_node
        parent_node.left = new_node
      end
    else
      if parent_node.right
        child_pos_placement(parent_node.right, value)
      else
        new_node.parent = parent_node
        parent_node.right = new_node
      end
    end
  end

  def child_count(parent_node)
    count = 0
    count += 1 if parent_node.left
    count += 1 if parent_node.right
    count
  end

end
