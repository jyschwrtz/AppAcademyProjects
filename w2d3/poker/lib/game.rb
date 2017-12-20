require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :players, :pot, :deck
  def initialize(opts = {})
    defaults = {
      players: [Player.new("Jesse"), Player.new("Stephen"), Player.new("Andres")],
      pot: 0,
      deck: Deck.new
    }
    options = defaults.merge(opts)
    @players = options[:players]
    @pot = options[:pot]
    @deck = options[:deck]
  end

  def run
    players.length.times do |round|
      # deal_hand #deals 5 cards to all players
      players.each do |player|
        player.play_hand
      end
    end
    print declare_winner
  end

  def deal_hand
    # @deck = Deck.new
    players.each do |player|
      5.times { @deck.deal(player) }
    end
  end

  def declare_winner
    largest_amount = 0
    winner = nil
    players.each do |player|
      if player.amount > largest_amount
        largest_amount = player.amount
        winner = player
      elsif player.amount == largest_amount &&
        largest_amount > 0
        winner = nil
        break
      end
    end
    if winner.nil?
      "It's a tie!"
    else
      "#{winner.name} wins! They have $#{winner.amount}"
    end
  end

  def take_all_bets
    players.each do |player|
      bet = player.place_bet
      case bet[:move]
      when "fold"
        next
      when "raise", "check"
        take_bet(bet[:value])
      end
    end
  end

  # private

  def take_bet(amt)
    @pot += amt
  end

end
