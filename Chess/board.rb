require_relative "piece.rb"
class Board
  attr_reader :grid

  def initialize
    make_starting_grid

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def dup()
  end

  def move_piece(color, from_pos, to_pos)
    raise ArgumentError if self[from_pos].is_a?(NullPiece)
    raise ArgumentError unless self[to_pos].is_a?(Piece) #Change with color

    self[from_pos], self[to_pos] = NullPiece.new(), self[from_pos]
  end

  def in_bounds(pos)
    return true if pos[0].between?(0,7) && pos[1].between?(0,7)
    false
  end


  def move_piece!(from_pos, to_pos)
  end

  def checkmate?()
  end

  private


  protected

  def make_starting_grid
    @grid = Array.new(8) { Array.new(8) }
    self[[0,0]] = Piece.new() #Rook
    self[[0,7]] = Piece.new() #Rook
    self[[7,0]] = Piece.new() #Rook
    self[[7,7]] = Piece.new() #Rook
    self[[0,1]] = Piece.new() #Knight
    self[[0,6]] = Piece.new() #Knight
    self[[7,1]] = Piece.new() #Knight
    self[[7,6]] = Piece.new() #Knight
    self[[0,2]] = Piece.new() #Bishop
    self[[0,5]] = Piece.new() #Bishop
    self[[7,5]] = Piece.new() #Bishop
    self[[7,2]] = Piece.new() #Bishop
    self[[0,4]] = Piece.new() #Queen
    self[[7,4]] = Piece.new() #Queen
    self[[0,3]] = Piece.new() #King
    self[[7,3]] = Piece.new() #King

    8.times do |column|
      self[[1, column]] = Piece.new() #Pawn
      self[[6, column]] = Piece.new() #Pawn
    end


    4.times do |row|
      8.times do |column|
        self[[row+2, column]] = NullPiece.new() #Empty
      end
    end
  end

  def find_king(color)
  end

end
