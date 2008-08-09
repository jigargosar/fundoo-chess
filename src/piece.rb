class Piece
  def initialize code
    @color,@name = *(code.split /\B/)
    @code = code
  end

  def inspect
    [@color,@name]
  end
end