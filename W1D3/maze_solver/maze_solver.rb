require 'byebug'

class Maze
attr_reader :grid, :start_pos, :end_pos, :lr_dir, :ud_dir, :current_pos
  def initialize(file_name)
    @grid = File.readlines(file_name).map(&:chomp)
    set_start_end_pos
    @current_pos = @start_pos.dup
    @previous_pos = nil
    @lr_dir = nil
    @ud_dir = nil
    @next_moves = []
  end

  def play
    render
    until @current_pos == @end_pos
      move
    end
    render
  end

  def render
    grid.each_index do |row|
      grid[row].chars.each_index do |col|
        pos = [row, col]
        print self[pos]
      end
      puts
    end
  end

  def set_start_end_pos
    grid.each_index do |row|
      grid[row].chars.each_index do |col|
        pos = [row, col]
        if self[pos] == "S"
          @start_pos = pos
        elsif self[pos] == "E"
          @end_pos = pos
        end
      end
    end
  end

  def decide_dir
    if @current_pos[0] < @end_pos[0]
      @lr_dir = :right
    else
      @lr_dir = :left
    end

    if @current_pos[1] < @end_pos[1]
      @ud_dir = :up
    else
      @ud_dir = :down
    end

    @next_moves = [@lr_dir, @ud_dir]
    @next_moves.unshift(:right) if @lr_dir == :left
    @next_moves.unshift(:left) if @lr_dir == :right
    @next_moves.unshift(:up) if @ud_dir == :down
    @next_moves.unshift(:dwon) if @ud_dir == :up
    @next_moves.map! { |el| parse_dir(el) }
  end

  def move
    @previous_pos = @current_pos
    self[@previous_pos] = "X" if self[@previous_pos] == " "
    decide_dir
    # debugger
    until @current_pos != @previous_pos || @next_moves.empty?
      if valid_move?(###########)
      next_move = @next_moves.pop
      combine_pos(@current_pos, next_move)
      if self[@current_pos] != "*"
        @current_pos = @previous_pos
      end
      next_move
    end
  end

  def valid_move?(next_pos)##########
    if @previous_pos == combine_pos(next_pos, @next_moves[-1])
      @next_moves.pop
    end
  end

  def combine_pos(pos1, pos2)
    pos1.each_index { |i| pos1[i] = pos1[i] + pos2[i] }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  # private

  def parse_dir(dir)
    directions = {
      left: [-1, 0],
      right: [1, 0],
      up: [0, 1],
      down: [0, -1]
    }
    directions[dir]
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Maze.new('maze1.txt')
  game.render
  p game.start_pos
  p game.end_pos
end
