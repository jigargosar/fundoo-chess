class Piece
  def initialize code
    @color, @name = *(code.split /\B/)
    @code = code
  end

  def inspect
    [@color, @name]
  end

  def legal_move? src, dest
    true
  end

  def can_occupy_location_with piece
    piece.nil? ? true : color_of(piece) != @color
  end

  def is_empty?
    @code == "--"
  end

  def black?
    @color == "b"
  end

  def path_clear? src, dest    
    path(src, dest).each do |next_location|
      return false unless yield next_location
    end
    return true
  end

  def path src, dest    
    []
  end
  
  private
  
  def color_of piece
    piece.instance_variable_get(:@color)
  end

  Empty = Piece.new("--")
end