class Board
  attr_reader :grid, :player

  def initialize(player, size = 4)
    @player = player
    @grid = Array.new(size) { Array.new(size) }
  end

  def populate
    deck = new_deck

    @grid.each_index do |row|
      @grid[row].each_index do |col|
        pos = [row, col]
        self[pos] = Card.new(deck.pop)
      end
    end
  end

  def new_deck
    deck = []
    2.times do
      (1..(@grid.size**2 / 2)).each do |num|
        deck << num
      end
    end

    deck.shuffle
  end

  def render
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        pos = [row, col]
        print "[#{self[pos].to_s}]"
      end
      print "\n"
    end
  end

  def won?
    @grid.flatten.all? { |card| card.face }
  end

  def reveal(guessed_pos)
    card = self[guessed_pos]
    if card.face
      puts "Card already face up."
      guessed_pos = @player.get_input
      card = self[guessed_pos]
    end
    card.reveal
    card.value
  end

  def [](pos)
    row, column = pos
    @grid[row][column]
  end

  def []=(pos, value)
    row, column = pos
    @grid[row][column] = value
  end

end
