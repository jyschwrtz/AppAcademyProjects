require_relative 'sliding_piece.rb'
require_relative 'piece.rb'

class Queen < Piece
  include SlidingPiece

  def initialize(color, board, pos)
    super
    @symbol = "Q"
  end

  protected

  def move_dirs
    diagonal_dirs.concat(horizontal_dirs)
  end

end
