require_relative '00_tree_node.rb'
require 'byebug'

class KnightPathFinder
  attr_accessor :visited_positions, :start_pos
  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
    @move_tree = []
  end

  def self.valid_moves(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end

  def self.new_moves(pos)
    x, y = pos
    moves = [
      [x+1, y+2],
      [x+1, y-2],
      [x-1, y+2],
      [x-1, y-2],
      [x+2, y-1],
      [x+2, y+1],
      [x-2, y-1],
      [x-2, y+1]
      ]
  end

  def new_move_positions(pos)
    positions = KnightPathFinder.new_moves(pos).reject do |el|
      @visited_positions.include?(el) || !KnightPathFinder.valid_moves(pos)
    end
    @visited_positions.concat(positions)
    positions
  end

  def build_move_tree
    queue = [PolyTreeNode.new(start_pos, nil, [])]

    until queue.empty?
      node = queue.shift
      @move_tree << node
      #return node if node.value == target_pos
      node_children = new_move_positions(node.value)
      node_children.each do |child|
        child_node = PolyTreeNode.new(child)
        node.add_child(child_node)
        queue.push(child_node)
      end

    end

  end

  def find_path(target_pos)
    build_move_tree
    results = nil
    @move_tree.each do |node|
      if node.value == target_pos
        results = node
        break
      end
    end

    current_node = results
    path = [current_node.value]
    until current_node.parent.nil?
      current_node = current_node.parent
      path.unshift(current_node.value)
    end
    path
  end

end

# def build_move_tree(target_pos)
#   queue = [start_pos]
#
#   until queue.empty?
#     element = queue.shift
#     return element if element == target_pos
#     list_positions = new_move_positions(element)
#     queue.concat(list_positions)
#
#   end
#   nil
# end
