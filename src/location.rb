class Location
  attr_reader :col, :row
  def initialize algebraic_notation
    algebraic_col, algebraic_row = *algebraic_notation.to_s.split(/\B/)
    @row = 8 - algebraic_row.to_i 
    @col = algebraic_col[0] - "a"[0]
  end

  def inspect
    "row=#{@row}, col=#{@col}"
  end
end