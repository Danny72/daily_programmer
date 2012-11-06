def print_board(grid,pos)
  print "    a b c d e f g h i j k l m n o  \n"
  print "   _______________________________\n"
  15.times do |y|
    x = y * 15
    print "#{sprintf '%02d',y+1} " 
    15.times { |z| (pos==z+x) ? (print "|\033[35m#{grid[z+x]}\033[0m") : (print "|\033[33m#{grid[z+x]}\033[0m") }
    print "|\n"
  end
end

def calc_board
  grid = []
  20.times { |x| grid << "M" }
  205.times { |y| grid << "-" }
  grid.shuffle!

  count = 0
  225.times do |x|
    if grid[x] == "M"
      count = 0
      next
    end
    count = count + 1 if grid[x-16] == "M"
    count = count + 1 if grid[x-15] == "M"
    count = count + 1 if grid[x-14] == "M"
    count = count + 1 if grid[x-1] == "M"
    count = count + 1 if grid[x+1] == "M"
    count = count + 1 if grid[x+14] == "M"
    count = count + 1 if grid[x+15] == "M"
    count = count + 1 if grid[x+16] == "M"
    grid[x] = count
    count = 0
  end
  return grid
end 

def calc_pos(input)
  col = 0
  input[0].each_byte { |c| col = c-97.to_i }
  row = input[1..2].to_i-1
  return (row*15)+col
end

def game_over
  3.times { |x| print "#############################\n" }
  puts "GAME OVER LADDY!"
  3.times { |x| print "#############################\n" }
  Process.exit! true
end

complete_board = calc_board
blank_board = []
225.times { |x| blank_board << "?" }
blank_board[215] = "X"
print_board(blank_board,500)


while true
  print "Enter a cell: "
  input = STDIN.gets.chomp
  break if input == "quit"
  puts complete_board[calc_pos(input)]
  game_over if complete_board[calc_pos(input)] == "M"
  blank_board[calc_pos(input)] = complete_board[calc_pos(input)]
  print_board(blank_board,calc_pos(input))
end
