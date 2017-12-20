require_relative "pieces.rb"

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
    raise ArgumentError.new("No piece there") if self[from_pos].is_a?(NullPiece)
    raise ArgumentError.new("Can't move there") unless self[from_pos].moves.include?(to_pos)

    self[from_pos].update_pos(to_pos)

    self[from_pos], self[to_pos] = NullPiece.instance, self[from_pos]
  end

  def in_bounds(pos)
    return true if pos[0].between?(0,7) && pos[1].between?(0,7)
    false
  end

  def not_blocked(from_pos, to_pos)
    return true if self[to_pos].is_a?(NullPiece)
    return true if self[to_pos].is_a?(Piece) && self[to_pos].color != self[from_pos].color
    false
  end

  def valid_move(from_pos, to_pos)
    in_bounds(to_pos) && not_blocked(from_pos, to_pos)
  end

  def move_piece!(from_pos, to_pos)
  end

  def in_check?(color, king_pos = nil)
    king_pos ||= find_king(color)

    8.times do |row|
      8.times do |col|
        pos = [row, col]
        if self[pos].color != color
          return true if self[pos].moves.include?(king_pos)
        end
      end
    end
    false
  end

  def checkmate?(color)
    king_pos = find_king(color)

    self[king_pos].moves.select { |pos| !in_check?(color, pos) }
                  .empty?
  end

  private

  def find_king(color)
    8.times do |row|
      8.times do |col|
        pos = [row, col]
        if self[pos].is_a?(King) && self[pos].color == color
          return pos

        end
      end
    end
  end
  protected

  def make_starting_grid
    @grid = Array.new(8) { Array.new(8) }
    self[[0,0]] = Rook.new(:black, self, [0,0]) #Rook
    self[[0,7]] = Rook.new(:black, self, [0,7]) #Rook
    self[[7,0]] = Rook.new(:white, self, [7,0]) #Rook
    self[[7,7]] = Rook.new(:white, self, [7,7]) #Rook
    self[[0,1]] = Knight.new(:black, self, [0,1]) #Knight
    self[[0,6]] = Knight.new(:black, self, [0,6]) #Knight
    self[[7,1]] = Knight.new(:white, self, [7,1]) #Knight
    self[[7,6]] = Knight.new(:white, self, [7,6]) #Knight
    self[[0,2]] = Bishop.new(:black, self, [0,2]) #Bishop
    self[[0,5]] = Bishop.new(:black, self, [0,5]) #Bishop
    self[[7,5]] = Bishop.new(:white, self, [7,5]) #Bishop
    self[[7,2]] = Bishop.new(:white, self, [7,2]) #Bishop
    self[[0,4]] = Queen.new(:black, self, [0,4]) #Queen
    self[[7,4]] = Queen.new(:white, self, [7,4]) #Queen
    self[[0,3]] = King.new(:black, self, [0,3]) #King
    self[[7,3]] = King.new(:white, self, [7,3]) #King

    8.times do |column|
      self[[1, column]] = Pawn.new(:black, self, [1, column]) #Pawn
      self[[6, column]] = Pawn.new(:white, self, [6, column]) #Pawn
    end


    4.times do |row|
      8.times do |column|
        self[[row+2, column]] = NullPiece.instance #Empty
      end
    end
  end

  def find_king(color)
  end

end
