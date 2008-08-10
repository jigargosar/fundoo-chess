require "piece"
require "pawn"
require "rook"

class Piece
  module Factory
    PIECES = {
            "--" => Empty,
            "wp" => Pawn::White,
            "bp" => Pawn::Black,
            "br" => Rook::Black,
            "wr" => Rook::White,
            }
    def self.create code
      PIECES[code] || Piece.new(code)
    end

    
  end
end