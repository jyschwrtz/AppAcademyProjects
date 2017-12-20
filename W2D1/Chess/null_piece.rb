require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = "-"
    @color = :red
  end

  def moves()
    []
  end

end
