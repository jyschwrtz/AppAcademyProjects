class HumanPlayer

  def initialize
  end

  def prompt
    puts "Pick a position"
  end

  def get_input(value)
    prompt
    parse(gets.chomp)
  end

  def parse(input)
    input.split(",").map(&:to_i)
  end

  def receive_revealed_card(pos, value)
  end

  def receive_match(pos1, pos2)
  end

  def delete_match(pos1, pos2)
  end
end
