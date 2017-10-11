require_relative 'stepping_piece.rb'
require_relative 'piece.rb'

class Knight < Piece
  include SteppingPiece

  def initialize(color, board, pos)
    super
    @symbol = "N"
  end

  protected

  def move_diffs
    [
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [2, 1],
    [-2, 1],
    [2, -1],
    [-2, -1]
    ]
  end

end
