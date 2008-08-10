require "piece"

class Pawn < Piece
  White = Pawn.new("wp")
  Black = Pawn.new("bp")

  def legal_move? src, dest
    if black?
      src = src.rotate_cordinate_space
      dest = dest.rotate_cordinate_space
    end
    ( src.same_column?(dest) && dest.is_ahead_of(src, :by=>1) ) ||
            ( src.same_column?(dest) && src.is_at_row?(2) && dest.is_ahead_of(src, :by=>2) )
  end
  
end