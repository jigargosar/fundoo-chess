require 'piece_factory'
require 'move'
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
        Piece::Factory.create(INITIAL_POSITION[row].split[col])
      }
    }
  end

  def move algebraic_src, algebraic_dest
    puts "Making move: #{algebraic_src},#{algebraic_dest}"
    move = Move.new(self, algebraic_src, algebraic_dest)    
    if move.is_valid?
      move_piece move.src, move.dest
    end
  end

  def draw
    puts_column_names
    row_index = 8
    @cells.each{|row|
      print "#{row_index}["
      print row.map{|piece| piece.inspect.to_s}.join(",")
      print "]#{row_index}\n"
      row_index-=1      
    }
    puts_column_names
  end

  def piece_at location
    @cells[location.array_row][location.array_col]
  end

  def is_location_empty? location    
    piece_at(location).is_empty?
  end
  
  private

  def puts_column_names
    print "  "
    ('a'..'h').each{|c| print "#{c}  "}
    puts
  end
  
  def move_piece src, dest
    src_piece = piece_at src
    @cells[src.array_row][src.array_col] = Piece::Empty
    @cells[dest.array_row][dest.array_col] = src_piece
  end

end