class Board

  def initialize
    @cells = Array.new(8){Array.new(8){Cell.new}}

    #    @cells[0][0].set_piece()
    #
    #    "rnrhsdfgf"
    #    "rnrhsdfgf"
    #    "---------"
  end

  def move src, dest
    piece = piece_at(src)
    if (piece.can_move?(src, dest))
      can_travel = piece.path(src, dest).travel{|next_location| piece_at(next_location).nil?}
      if can_travel
        if piece.can_kill(piece_at(dest))
          move_piece(src, dest)
        end
      end
    end

    if(leagel_piece_move && legal_path && legeal_destination)
      move_piece(src, dest)
    end
  end

  def draw
    puts "hi"
  end
end