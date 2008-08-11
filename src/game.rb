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

board.move :a3, :f3
board.draw

board.move :h8, :h4
#board.move_piece(:from=>:h8, :to=>:h4)
board.draw

while false
  board.draw
  print "Make move (e.g d2 d4):"
  src, dest = gets.chomp.split
  board.move src, dest
end