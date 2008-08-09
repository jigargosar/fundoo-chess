require "piece"
require "pawn"

class Piece
  module Factory
    PIECES = {
            "--" => Empty,
            "wp" => Pawn::White,
            "bp" => Pawn::Black,
            }
    def self.create code
      PIECES[code] || Piece.new(code)
    end

    
  end
end