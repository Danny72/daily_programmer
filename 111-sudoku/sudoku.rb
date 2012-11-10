def draw_board(s_grid)
  num = Math.sqrt(s_grid.size).to_i
  num.times do |x| 
    print "["
    row = x*num 
    num.times {|y| print " #{s_grid[y+row]} "}
    print "]\n"
  end
end

def create_matrix(size)
  mat = Array.new(size*size) {|x| Array.new(size*size) {}}
  i = size*size
  i.times {|x| i.times { |y| mat[x][y] = (x*size + x/size + y) % i + 1 }}
  mat.flatten!
end

draw_board create_matrix(3)
