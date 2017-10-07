require "colorize"

class Tile
attr_reader :value

  def initialize(value)
    @value = value
    if value == 0
      @given = false
    else
      @given = true
    end
  end

  def to_s
    return @value.to_s.colorize(:red) if @given

    @value.to_s
  end

end
