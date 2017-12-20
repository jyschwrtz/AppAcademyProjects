module SteppingPiece

  def moves
    poss_moves = move_diffs.map {|diff| add_pos(diff, @pos) }
    poss_moves.select { |new_pos| @board.valid_move(@pos, new_pos) }
  end



  private

  def move_diffs
  end

  def add_pos(pos1, pos2)
    pos1.map!.with_index { |el, idx| pos1[idx] + pos2[idx] }
  end

end
