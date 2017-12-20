require 'byebug'
module SlidingPiece

  def moves
    grow_unblocked_moves_in_dir
  end

  private

  def move_dirs
  end

  def horizontal_dirs
    [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]
  end

  def diagonal_dirs
    [
    [1, 1],
    [-1, 1],
    [1, -1],
    [-1, -1]
  ]
  end

  def grow_unblocked_moves_in_dir
    start_pos = @pos
    poss_moves = []

    poss_dir = move_dirs

    poss_dir.each do |dir|
      taken = 0
      new_pos = add_pos(start_pos.dup, dir)
      while @board.valid_move(start_pos, new_pos) && taken < 2
        poss_moves << new_pos.dup
        new_pos = add_pos(new_pos, dir)
        if @board[new_pos].is_a?(NullPiece)
          next
        else
          taken += 1 if @board[new_pos].color != @board[start_pos].color
        end
      end
    end
    poss_moves
  end

  def add_pos(pos1, pos2)
    pos1.map!.with_index { |el, idx| pos1[idx] + pos2[idx] }
  end



end
