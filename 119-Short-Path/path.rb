def calc_neighbours(node,path)
  length = Math.sqrt(path.length).to_i
  nbors = {}
  nbors[:right] = node+1 if node+1 >= 0 and (node+1)%length != 0 and path[node+1] != "."
  nbors[:down] = node+length if node+length >= 0 and node+length < path.length and path[node+length] != "."         
  nbors[:up] = node-length if node-length >= 0 and path[node-length] != "."
  nbors[:left] = node-1 if node-1 >= 0 and node%length != 0 and path[node-1] != "."
  return nbors.values
end

def calc_path(path)
  path = path.split('')
  path.each_slice(Math.sqrt(path.length)) {|x| puts x.join(" ")} 
  end_node = path.index("E")
  distance = Array(0..path.length).map! {|x| x = [0,(1/0.0)]}
  previous = Array(0..path.length)
  distance[0] = [0,0]

  while distance.min[0] != 1     
    current = distance.index(distance.min)
    break if path[current] == "E"
    results = calc_neighbours(current,path)
    if distance[current][1] == (1/0.0)
      break
    end
    results.each do |x|
      if distance[current][1] + 1 < distance[x][1] 
        distance[x][1] = distance[current][1] + 1
        previous[x] = current
      end
    end
    distance[current][0] = 1
  end
  
  if distance[end_node][1] != (1/0.0)
    puts "TRUE #{distance[end_node][1]}"
  else
    puts "FALSE"
  end
  stack = []
  while previous[current] != 0
    stack << previous[current]
    current = previous[current]
  end
  stack.each{|x| path[x] = "+"}
  path.each_slice(Math.sqrt(path.length)) {|x| puts x.join(" ")} 
end

length = ARGV[0].to_i
input = length.to_s + "S"
(2..(length*length)-1).each do |x|
  if rand(5) == 3 or rand(5) == 4
    input << "."
  else
    input << " "
  end
end
input << "E"
puts input
calc_path(input[2..-1])
