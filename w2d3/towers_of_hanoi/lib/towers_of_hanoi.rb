class TowersOfHanoi

  attr_reader :board

  def initialize(board = [[3, 2, 1], [], []])
    @board = board
  end

  def play
    until won?
      display
      take_turn
    end
    display
    puts "You won!"
  end

  def display
    puts @board.inspect
  end

  def take_turn
    puts "Please enter a from position and to position:"
    play = gets.chomp.split(", ").map(&:to_i)
    move(play[0], play[1])
  end

  def move(from_pos, to_pos)
    from_tower = @board[from_pos]
    to_tower = @board[to_pos]

    if to_tower.empty? || (from_tower.last < to_tower.last)
      to_tower << from_tower.pop
    end
  end

  def won?
    @board[0].empty? &&
      (@board[1] == [3, 2, 1] || @board[2] == [3, 2, 1])
  end
end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
