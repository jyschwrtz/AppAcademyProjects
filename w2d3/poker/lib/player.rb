require_relative 'hand'

class Player
  attr_accessor :hand
  def initialize(name, hand = [])
    @name = name
    @hand = Hand.new(hand)
  end

  def play_hand
  end

end
