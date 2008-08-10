require "piece"

class Rook < Piece
  White = Rook.new("wr")
  Black = Rook.new("br")

  def legal_move? src, dest
    src.same_column?(dest) || src.same_row?(dest)
  end

  # todo: this method needs more redability, also should we use facotory to create a location object?
  # todo: this method is incomplete doesn't take horizontal movement into account.
  def path src, dest
    ((src.row+1)...dest.row).map{|row| Location.new(row, src.col)}
  end
  
end