$encode = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+/".split("")

def to_base10(input, base)
  exponent = input.length-1
  base = base.to_i
  input = input.split("").map {|x| $encode.index(x)}
  result = 0
  input.each do |x|
    result += x * (base ** exponent)
    exponent -= 1
  end
  return result
end

def from_base10(input, base)
  result = []
  quotient = -1
  while quotient != 0
    quotient = input/base
    result.unshift($encode[input%base])
    input = quotient
  end
  return result.join("")
end


num = "e1f1"
base = "25"
dic = File.read("dic.txt").split("\r\n").join(",")

dec_num = to_base10(num,base) 

(2..63).each do |x|
  result = from_base10(dec_num,x)
  if x != base
    print "    base%02d: %s" % [x,result]
    match = dic=~/,#{result.downcase},/
    print " | found in dictionary " if match
    puts
  else
    puts "    %base02d: %s" % [base, num]
    match = dic=~/,#{result.downcase},/
    print " | found in dictionary " if match
    puts
  end
end
