class Piece  
  def initialize code
    @color,@name = *(code.split /\B/)
    @code = code
  end

  def inspect
    [@color,@name]
  end

  def legal_move? src, dest
    true
  end

  def path_clear? src, dest
    true
  end

  def can_occupy_location_with piece
    piece.nil? ? true : piece.color != @color 
  end

  def is_empty?
    @code == "--"
  end

  def color
    @color
  end

  EMPTY = Piece.new("--")
end