class Pawn < Piece

  def initialize(color, board, pos)
    super
    @symbol = "P"
    @at_start_row = true
  end

  def moves
    forward_steps + side_attacks
  end

  protected

  def at_start_row?
    @at_start_row
  end

  def forward_dir
    return :down if @color == :black
    :up
  end

  def forward_steps
    diffs = []
    if forward_dir == :down
      if @at_start_row
        diffs = [[1,0], [2,0]]
      else
        diffs = [[1,0]]
      end
    else
      if @at_start_row
        diffs = [[-1,0], [-2,0]]
      else
        diffs = [[-1, 0]]
      end
    end
    diffs.map { |diff| add_pos(diff, @pos) }
  end

  def side_attacks
    poss_moves = []
    if forward_dir == :down
      [[1,1], [1,-1]].each do |new_pos|
        new_pos = add_pos(new_pos, @pos)
        if @board[new_pos].is_a?(NullPiece)
          next
        else
          poss_moves << new_pos if @board[new_pos].color != @board[@pos].color
        end
      end
    else
      [[-1,-1], [-1,1]].each do |new_pos|
        new_pos = add_pos(new_pos, @pos)
        if @board[new_pos].is_a?(NullPiece)
          next
        else
          poss_moves << new_pos if @board[new_pos].color != @board[@pos].color
        end
      end
    end
    poss_moves
  end

  def add_pos(pos1, pos2)
    pos1.map!.with_index { |el, idx| pos1[idx] + pos2[idx] }
  end

end
