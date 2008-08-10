require "piece"

class Rook < Piece
  White = Rook.new("wr")
  Black = Rook.new("br")

  def legal_move? src, dest
    src.same_column?(dest) || src.same_row?(dest)
  end

  def path src, dest
    src.straight_path_to dest    
  end

end