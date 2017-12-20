require_relative 'sliding_piece.rb'
require_relative 'piece.rb'

class Rook < Piece
  include SlidingPiece

  def initialize(color, board, pos)
    super
    @symbol = "R"
  end

  protected

  def move_dirs
    horizontal_dirs
  end

end
