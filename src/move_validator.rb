require 'forwardable'

class MoveValidator
  extend Forwardable

  def_delegators :@board, :location_empty?, :piece_at?

  def initialize board, src, dest
    @board = board
    @src = src
    @dest = dest
  end

  def is_valid?
    # todo: will have to add more common validation, like src == dest and src,dest within bounds
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

  def is_destination_within_legal_movable_range_of_the_piece?
    src_piece.legal_move?(@src, @dest)
  end

  def is_path_to_destination_clear?
    src_piece.path_clear?(@src, @dest) do |next_location|
      location_empty?(next_location)
    end
  end
end