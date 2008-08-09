class MoveValidator

  def initialize board, src, dest
    @board = board
    @src = src
    @dest = dest
  end

  def is_valid?
    is_destination_within_legal_movable_range_of_the_piece? &&
            is_path_to_destination_clear? &&
            src_piece.can_occupy_location_with(dest_piece)
  end

  private

  def src_piece
    @board.piece_at @src
  end

  def dest_piece
    @board.piece_at @dest
  end

  def piece_at location
    @board.piece_at location
  end

  def location_empty? location
    @board.location_empty? location
  end

  def is_destination_within_legal_movable_range_of_the_piece?
    src_piece.move_legal?(@src, @dest)
  end

  def is_path_to_destination_clear?
    src_piece.path_clear?(@src, @dest) do |next_location|
      location_empty?(next_location)
    end
  end

  def can_piece_occupy_destination?
    src_piece.can_occupy_location_with(dest_piece)
  end

end