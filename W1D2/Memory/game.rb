require_relative "card"
require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
attr_reader :player, :board

  def initialize(player)
    @board = Board.new(player, 4)
    @board.populate
    @player = player
  end

  def play
    until game_over?
      @board.render
      make_guess
      sleep(3)
      system("clear")
    end
    puts "You win!"
  end

  def game_over?
    @board.won?
  end

  def make_guess
    guess1 = player.get_input(nil)
    board.reveal(guess1)
    player.receive_revealed_card(guess1, @board[guess1].value)
    system("clear")
    board.render
    guess2 = player.get_input(@board[guess1].value)
    board.reveal(guess2)
    player.receive_revealed_card(guess2, @board[guess2].value)
    system("clear")
    board.render
    if @board[guess1].value == @board[guess2].value
      puts "Match!"
      player.receive_match(guess1, guess2)
      player.delete_match(guess1, guess2)
    else
      board[guess1].hide
      board[guess2].hide
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Human or computer player?"
  player = gets.chomp.downcase
  if player == "human"
    Game.new(HumanPlayer.new).play
  elsif player == "computer"
    Game.new(ComputerPlayer.new(4)).play
  else
    "Incorrect input. Please choose human or computer."
  end
end
