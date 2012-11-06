def recur(x)
  x = x.to_s
  if (x.length == 1) | (x == '')
    return true
  else
    x[0] == x[x.length-1] ? (recur(x[1..x.length-2])) : (return false) 
  end
end

def palin(a,b,c,d) 
  a, b = (a..b), (c..d)
  b.each do |b|
    a.each do |a|
      puts "#{a} X #{b}" if recur(a*b)
    end
  end
end

palin(ARGV[0].to_i,ARGV[1].to_i,ARGV[2].to_i,ARGV[3].to_i)
