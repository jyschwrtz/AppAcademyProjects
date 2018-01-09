# Post Order Traversal:
def post_order_traversal(tree_node = @root, arr = [])
  if tree_node.left
    post_order_traversal(tree_node.left, arr)
  end

  if tree_node.right
    post_order_traversal(tree_node.right, arr)
  end

  arr << tree_node.value

  arr
end


# Pre Order Traversal:
def pre_order_traversal(tree_node = @root, arr = [])
  arr << tree_node.value

  if tree_node.left
    pre_order_traversal(tree_node.left, arr)
  end

  if tree_node.right
    pre_order_traversal(tree_node.right, arr)
  end

  arr
end

# In Order Traversal Iteratively

def in_order_traversal(tree_node = @root, arr = [])

    stack = []
    current = tree_node
    until current.nil? && stack.empty?
      if current
        stack << current
        current = current.left
      else
        top_node = stack.pop
        p top_node.value
        current = top_node.right
      end
    end

end

1 create empty stack
2. initialize current node as subtree_root3. push the current into the stack and set current as current.left until current is null;
4. if current is null and stack isn't empty:
  a. pop top item from stack and print
  b. set current to popped item right_depth
  c. go back


# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.
