load 'Player.rb'
require 'byebug'

class GhostGame
  attr_accessor :fragment
  def initialize(players, dict = "dictionary.txt")
    @players_arr = players.map { |name| Player.new(name) }
    # @player1 = Player.new(player1)
    # @player2 = Player.new(player2)
    @fragment = ""
    array = File.readlines(dict).map(&:chomp)
    @dictionary = {}
    array.each { |el| @dictionary[el] = el.length }
    @current_player = @players_arr.first
    @previous_player = @players_arr.last
    @losses = Hash.new(0)
  end

  def play_game
    until @players_arr.length == 1
      until @losses.values.any? { |val| val == 5 }
        play_round
      end
      game_over
    end
    puts "#{current_player}, you win!"
  end

  def play_round
    # p1 goes first for now
    # p1 gives guess, until valid, then next turn
    # set order of players
    @fragment = ""
    puts "New Round!"
    display_standings
    until complete_word?(@fragment)
      take_turn
      next_player!
    end

    round_over!
  end

  def current_player
    @current_player.name
  end

  def previous_player
    @previous_player.name
  end

  def next_player!

    @previous_player = @current_player
    @players_arr.rotate!(1)
    @current_player = @players_arr.first
  end

  def take_turn
    #pass in a player to get their input
    letter = ""
    until valid_play?(letter)
      letter = @current_player.guess(@fragment)
    end

    @fragment << letter
  end

  def valid_play?(string = "")
    # check if string (char) is a valid letter and if it makes any words
    return false if string == ""
    if @dictionary.keys.any? { |word| word.index(@fragment + string) == 0 }
      true
    else
      @current_player.alert_invalid_guess
      false
    end
  end

  def complete_word?(string)
    @dictionary.keys.include?(string)
  end

  def record(player)
    lost = @losses[player]
    string = "GHOST"
    return "" if lost == 0
    string[0...lost]
  end

  def display_standings
    @losses.each_key do |name|
      puts "#{name} you are at #{record(name)}."
    end
  end

  def round_over!
    puts "#{previous_player}, you have lost this round."
    @losses[previous_player] += 1
  end

  def game_over
    puts "#{previous_player}, you have lost the game."
    display_standings
    @players_arr.delete(@previous_player)
    @losses.delete(previous_player)
  end

end


if __FILE__ == $PROGRAM_NAME
  p "How many players?"
  num = gets.chomp.to_i
  #correct digit assumed
  players = []
  num.times do |idx|
    p "Player #{idx + 1} enter your name: "
    players << gets.chomp
  end

  game = GhostGame.new(players)
  game.play_game
end
