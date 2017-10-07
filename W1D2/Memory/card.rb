class Card
  attr_reader :value, :face

  def initialize(value)
    @value = value
    @face = false
  end

  def hide
    @face = false
  end

  def reveal
    @face = true
  end

  def to_s
    if @face
      @value.to_s
    else
      "X"
    end
  end

  # def ==(other_card)
  #   self.value == other_card.value
  # end

end
