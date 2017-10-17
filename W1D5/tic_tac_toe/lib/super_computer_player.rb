require_relative 'tic_tac_toe_node'
require 'byebug'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    winning_nodes = []
    non_losing_nodes = []
    node.children.each do |child_node|
      if child_node.winning_node?(mark)
        winning_nodes << child_node
      else
        non_losing_nodes << child_node unless child_node.losing_node?(mark)
      end
      debugger
    end
    #PROBLEM IN HERE -- NOT RETURNING ANYTHING INTO WINNERS OR NON-LOSERS
    if winning_nodes.empty?
      raise if non_losing_nodes.empty?
      non_losing_nodes.first.prev_move_pos
    else
      winning_nodes.first.prev_move_pos
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jay")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
