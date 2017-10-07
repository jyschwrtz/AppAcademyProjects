require "byebug"

class ComputerPlayer

  def initialize(size)
    @known_cards = {}
    @matched_cards = []
    @possible_positions = (0...size).to_a.repeated_permutation(2).to_a
  end

  def prompt
    puts "Pick a position"
  end

  def get_input(value)
    matches = @known_cards.select { |key, val| @known_cards.values.count(val) == 2 }
    if !value #first guess
      # is there a match in known_cards?
      return @possible_positions.first if matches.empty?
      matches.keys[1]
      # random position
    else # second guess
      # return position of guess1 value's match
      return @possible_positions.last if matches.empty?
      matches.keys[0]
      # else guess random
    end
  end

  # def random
  #   @possible_positions.sample
  # end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
    @possible_positions.delete(pos)
  end

  def receive_match(pos1, pos2)
    @matched_cards << [pos1, pos2]
  end

  def delete_match(pos1, pos2)
    @known_cards.delete(pos1)
    @known_cards.delete(pos2)
  end

end
