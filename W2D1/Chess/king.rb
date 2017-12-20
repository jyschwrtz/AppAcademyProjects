require_relative 'stepping_piece.rb'
require_relative 'piece.rb'

class King < Piece
  include SteppingPiece

  def initialize(color, board, pos)
    super
    @symbol = "K"
  end

  protected

  def move_diffs
    [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1],
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
    ]
  end

end
