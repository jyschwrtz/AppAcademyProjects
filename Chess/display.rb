require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'


class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @cursor_pos = @cursor.cursor_pos
    render
  end

  def render
    @board.grid.each_index do |row|
      @board.grid[row].each_index do |column|
        if @cursor_pos == [row, column]
          print "X".colorize(:red)
        else
          print "#{@board[[row, column]].symbol}"
        end
      end
        puts
    end
  end

  def move(new_pos)

  end

  def test
    while true
      system("clear")
      render
      @cursor.get_input

    end

  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.test
end
