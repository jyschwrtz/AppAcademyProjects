class Game

  def initialize(player)
    @player = player
  end

  def play
    until solved?
      player.get_input
    end
  end

  def solved?
  end


end
