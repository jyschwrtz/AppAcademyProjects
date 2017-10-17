require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      if @board.winner != evaluator
        return true
      else #draw or win
        return false
      end
    end

    if evaluator == @next_mover_mark
      children.all? { |node| node.losing_node?(evaluator) }
    else
      children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      if @board.winner == evaluator
        return true
      else
        return false
      end
    end

    if evaluator == @next_mover_mark
      children.any? { |node| node.winning_node?(evaluator) }
    else
      children.all? { |node| node.winning_node?(evaluator) }
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []
    @board.rows.each_index do |row|
      @board.rows[row].each_index do |col|
        pos = [row, col]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          next_mark = (@next_mover_mark == :x ? :o : :x )
          nodes << TicTacToeNode.new(new_board, next_mark, pos)
        end
      end
    end
    nodes
  end
end
