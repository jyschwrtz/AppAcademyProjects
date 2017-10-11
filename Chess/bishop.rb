require_relative 'sliding_piece.rb'
require_relative 'piece.rb'

class Bishop < Piece
  include SlidingPiece

  def initialize(color, board, pos)
    super
    @symbol = "B"
  end

  protected

  def move_dirs
    diagonal_dirs
  end

end
