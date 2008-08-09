require 'piece'
require 'move_validator'
require 'location'

class Board
  INITIAL_POSITION =
          [       "br bn bb bq bk bb bn br",
                  "bp bp bp bp bp bp bp bp",
                  "-- -- -- -- -- -- -- --",
                  "-- -- -- -- -- -- -- --",
                  "-- -- -- -- -- -- -- --",
                  "-- -- -- -- -- -- -- --",
                  "wp wp wp wp wp wp wp wp",
                  "wr wn wb wq wk wb wn wr",
          ]
  MAX_ROWS = 8
  MAX_COLS = 8

  def initialize
    @cells = Array.new(MAX_ROWS){|row|
      Array.new(MAX_COLS){|col|
        Piece.new(INITIAL_POSITION[row].split[col])
      }
    }
  end

  def move src, dest
    src_location, dest_location = Location.new(src), Location.new(dest)

    if MoveValidator.new(self, src_location, dest_location).is_valid?
      move_piece src_location, dest_location
    end
  end

  def draw
    p @cells
  end

  def piece_at location
    @cells[location.row][location.col]
  end
  
  private
  def move_piece src, dest
    src_piece = piece_at src 
    @cells[src.row][src.col] = nil
    @cells[dest.row][dest.col] = src_piece
  end

end