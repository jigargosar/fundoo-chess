require "piece"

class Pawn < Piece
  White = Pawn.new("wp")
  Black = Pawn.new("bp")

  def legal_move? src, dest    
    ( src.same_column?(dest) && src.is_ahead_of(dest, :by=>1) ) ||
            ( src.same_column?(dest) && src.col = 6 && src.is_ahead_of(dest, :by=>2))  


  end
  
end