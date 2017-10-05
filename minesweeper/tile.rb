class Tile

  def initialize(options = {})
    defaults = { bomb: false, reveal: false }
    options = defaults.merge(options)
    @bomb = options[:bomb]
    @reveal = options[:reveal]
  end
end
