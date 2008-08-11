require "piece"

class Rook < Piece
  White = Rook.new("wr")
  Black = Rook.new("br")

  def legal_move? src, dest
    src.is_same_column_as(dest) || src.is_same_row_as(dest)
  end

  def path src, dest    
    src.straight_path_to dest    
  end

end