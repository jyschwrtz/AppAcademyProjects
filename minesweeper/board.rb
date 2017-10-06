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
        val = nearby_bombs([row,col])
        grid[row][col] = Tile.new(bomb: false, value: val) if grid[row][col].nil?
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
    grid[x][y] = Tile.new(bomb: true, value: 0)
  end

  def render
    puts "  #{(0..8).to_a.join("  ")}"

    @grid.each_index do |row|
      print row
      @grid[row].each do |char|
        print " #{ char.to_s } "
      end
      puts
    end
  end

  def nearby_bombs(pos)  #### DID NOT FINISH THIS!
    count = 0
    x, y = pos
    @grid[y-1].each.with_index do |abv_tile, idx|
      count += 1 if abv_tile.bomb && idx.between?(x-1, x+1)
    end
    @grid[y+1].each.with_index do |below_tile, idx|
      count += 1 if below_tile.bomb && idx.between?(x-1, x+1)
    end
    @grid[y].each.with_index do |adj_tile, idx|
      count += 1 if adj_tile.bomb && idx == x-1 || x+1
    end
    count
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
