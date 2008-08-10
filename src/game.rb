require 'board'

board = Board.new
board.draw
board.move :d2, :d4
board.draw
board.move :d7, :d5
board.draw
board.move :a1, :a3
board.draw

board.move :a2, :a4
board.draw


board.move :a1, :a3
board.draw
