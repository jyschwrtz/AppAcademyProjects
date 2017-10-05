require_relative 'tile.rb'

class Board

  attr_reader :grid, :num_bombs

  def initialize(size = 9, num_bombs = 10)
    @grid = empty_grid(size)
    @num_bombs = num_bombs

  end

  def empty_grid(size)
    Array.new(size) { Array.new(size) }
  end

  def populate_grid
    num_bombs.times {place_bombs}

    grid.each_index do |row|
      grid[row].each_index do |col|
        grid[row][col] = Tile.new(bomb: false, reveal: false) if grid[row][col].nil?
      end
    end
  end

  def place_bombs
    x = (0..8).to_a.sample
    y = (0..8).to_a.sample

    until grid[x][y].nil?
      x = (0..8).to_a.sample
      y = (0..8).to_a.sample
    end
    grid[x][y] = Tile.new(bomb: true, reveal: false)
  end

  def [](pos)
    x, y = pos
    grid[y][x]
  end

  def []=(pos, value)
    x, y = pos
    grid[y][x] = value
  end

end
