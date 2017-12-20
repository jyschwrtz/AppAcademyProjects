class Card
  attr_reader :name, :suit, :value, :flipped
  
  def initialize(name, suit, value)
    @name, @suit, @value = name, suit, value
    @flipped = false
  end

  def flip
    @flipped = (@flipped ? false : true)
  end

end
