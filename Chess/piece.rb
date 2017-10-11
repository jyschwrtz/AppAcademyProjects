class Piece
  attr_accessor :pos
  attr_reader :symbol, :color

  def initialize(color = :white, board, pos)
    @symbol = "P"
    @color = color
    @color1 = :black
    @color2 = :white
    @board = board
    @pos = pos
  end

  def to_s()
  end

  def empty?()
  end

  def update_pos(new_pos)
    @pos = new_pos
  end

  def valid_moves()
  end

  private
  def move_into_check(to_pos)
  end

end
