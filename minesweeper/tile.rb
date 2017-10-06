class Tile
attr_reader :bomb, :flag, :value

  attr_accessor :reveal, :bomb

  def initialize(options = {})
    defaults = { bomb: false, value: 0 }
    options = defaults.merge(options)
    @bomb = options[:bomb]
    @reveal = false
    @flag = false
    @value = options[:value]
  end

  def to_s
    if @reveal
      if @bomb
        "!"
      else
        @value.to_s if @value > 0
        "-" if @value == 0
      end
    else
      if @flag
        "F"
      else
        "*"
      end
    end
  end

  def show_tile
    @reveal = true
  end

  def flag_tile
    @flag = true
  end

end
