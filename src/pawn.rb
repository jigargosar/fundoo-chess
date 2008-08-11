require "piece"

class Pawn < Piece
  White = Pawn.new("wp")
  Black = Pawn.new("bp")

  # todo: include logic of killing in diagonal, will have to pass is_destination_occupied flag.
  def legal_move? src, dest
    if black?
      src = src.rotate_cordinate_space
      dest = dest.rotate_cordinate_space
    end
    ( src.is_same_column_as(dest) && dest.is_ahead_of(src, :by=>1) ) ||
            ( src.is_same_column_as(dest) && src.is_at_row?(2) && dest.is_ahead_of(src, :by=>2) )
  end

  # todo: include logic of moving/killing in diagonal
  def path src, dest
    src.straight_path_to dest
  end

end