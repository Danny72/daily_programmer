#finding simple cycles in a graph using Tarjans SCC algorithm
$vertices = []
$edges = []
$index = 0
$stack = []

def read_input(vertices,edges)
  input = File.read(ARGV[0]).split("\n")
  edge_num = input[0].to_i

  edge_num.times { |x| vertices.push([x+1,nil,nil]) }
  edge_num.times { |x| edges.push([input[x+1].split(" ")[0].to_i,
                                   input[x+1].split(" ")[1].to_i]) }

  return vertices, edges
end

def strong_connect(v)
  #sets the depth index for v to the smallest unused index
  v[1] = $index
  v[2] = $index
  $index += 1
  $stack.push(v)

  #consider the successors of v
  neighbours = $edges.select { |x| x[0] == v[0] }
  neighbours.each do |w|
    if $vertices[w[1]-1][1] == nil
      #successor w hasn't been visited, recurse over it
      strong_connect $vertices[w[1]-1]
      v[2] = [v[2],$vertices[w[1]-1][2]].min
    elsif ($stack.index($vertices[w[1]-1]) != nil)
      #successor w is in stack and herefore in current SCC
      v[2] = [v[2],$vertices[w[1]-1][1]].min
    end
  end

  #if v is a root node, pop stack and generate an scc
  if (v[2] == v[1]) 
    result = []
    loop do
      w = $stack.pop
      result.push w[0]
      break if w == v
    end
    if result.size > 1
      result = result.reverse.push(result[-1])
      result.each { |x| print "#{x} " }
      puts ""
    end
  end
end

vertices = []
edges = []
result = []

$vertices, $edges = read_input(vertices,edges)
vertices.each do |v|
  if v[1] == nil
    strong_connect v
  end
end

