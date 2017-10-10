class Piece
  attr_reader :symbol

  def initialize(color)
    @symbol = "P"
    @color = color
    @color1 = :black
    @color2 = :white
  end

  def to_s()
  end

  def empty?()
  end

  def symbol()
  end

  def valid_moves()
  end

  private
  def move_into_check(to_pos)
  end

end


class Pawn < Piece

  def initialize
    @symbol = "P"
    @at_start_row = true

  end

  def moves

  end

protected

  def at_start_row?
    @at_start_row
  end

  def forward_dir

  end

  def foward_steps
  end

  def side_attacks
  end


end






class NullPiece < Piece

  def initialize
    @symbol = " "
  end

  def moves()
  end

end
