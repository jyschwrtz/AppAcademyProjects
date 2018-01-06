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
    if @root == node_del
      @root = nil
    elsif node_del.left == nil && node_del.right == nil
      parent_del = node_del.parent
      if parent_del.left == node_del
        parent_del.left = nil
      else
        parent_del.right = nil
      end
    # elsif
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
    # count = 0
    # until tree_node.right == nil && tree_node.left == nil
    #
    # end
    # count
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
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

end
