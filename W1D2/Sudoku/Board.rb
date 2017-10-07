require_relative "Tile.rb"
require "colorize"

class Board

  def initialize(filename)
    @grid = Array.new(9) { Array.new(9) }
    @filename = filename
  end

  def populate
    possible_pos = (0...9).to_a.repeated_permutation(2).to_a
    sudoku_puzzle = Board.from_file(@filename)

    possible_pos.each do |pos|
      self[pos] = Tile.new(sudoku_puzzle[pos[0]][pos[1]])
    end
  end

  def self.from_file(filename)
    array = File.readlines(filename).map(&:chomp)
    array.map do |row|
      row.chars.map(&:to_i)
    end
  end

  def render
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        pos = [row, col]
        print "[#{self[pos]}]"
      end
      print "\n"
    end
  end

  def solved?
    rows_solved? && cols_solved? && squares_solved?
  end

  def rows_solved?
    @grid.all? do |row|
      row_nums = row.map(&:value)

      row_nums.sort.uniq == (1..9).to_a
    end
  end

  def cols_solved?
  end

  def squares_solved?
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end
