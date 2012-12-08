def ncset(input,n)
  input.strip.chars.sort.join.squeeze.length <= n
end

puts ncset("aeacaabbabcccd",4)
puts ncset("aaaaaaaaa",5)
puts ncset("abcdefgh",3)

start = Time.now
hold = 0
file = File.open('dic.txt').each_line{|x| hold+=1 if ncset(x,4); total+=1}
puts "Number hold: #{hold} out of #{total} in #{Time.now - start}"
