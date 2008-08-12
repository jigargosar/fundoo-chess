## Location abstracts a cordinate in the chess cordinate space, a0-f8.
## i.e. 0,0 is at the lower left corner.
## array_row and array_col methods convert the cordinate from current
## default cordinate system (0,0 at lower-left corner) to
## that (0,0 at upper-left corner) of an two dimentional array. 
## todo: can we refactor this class to better handle algebriac notation, cordinate space rotation etc.
class Location
  attr_reader :array_row, :array_col
  attr_reader :row, :col

  ## todo: This method requires clean up
  def self.algebraic algebraic_notation
    algebraic_col, algebraic_row = *algebraic_notation.to_s.split(/\B/)
    row = algebraic_row.to_i
    col = algebraic_col[0] - "a"[0] + 1
    Location.new(row, col)
  end

  ## many rules of white piece can be simply applied to blacks just by rotating the cordinate space.
  ## 
  def rotate_cordinate_space
    Location.new(9 - @row, 9 - @col)
  end

  def array_col
    @col - 1
  end

  def array_row
    8 - @row
  end

  def conflicting_change? location
    @col == get_column_of(location)
  end

  def same_row? location
    @row == get_row_of(location)
  end

  def is_ahead_of location, options
    @row - options[:by] == get_row_of(location)
  end

  def is_at_row? row
    @row == row
  end

  def straight_path_to dest
    if same_column? dest      
      range = @row < dest.row ? ((@row+1)...dest.row) : ((dest.row+1)...(@row))
      range.map{|row| Location.new(row, @col)}
    elsif same_row? dest
      range = @col < dest.col ? ((@col+1)...dest.col) : ((dest.col+1)...(@col))
      range.map{|col| Location.new(@row, col)}
    else
      # todo: should throw some exception?
      []
    end
  end
  

  def inspect
    "row=#{@row}, col=#{@col}"
  end

  private

  def initialize row, col
    @row = row
    @col = col
  end

  def get_column_of location
    location.instance_variable_get(:@col)
  end

  def get_row_of location
    location.instance_variable_get(:@row)
  end
end