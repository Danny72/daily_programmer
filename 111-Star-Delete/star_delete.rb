# matches 0 or 1 character before star, 1 or more star
# and 0 or 1 character after star

def star_delete(input)
  input.gsub(/.?\*+.?/,'')
end

puts "adf*lp > #{star_delete("adf*lp")}"
puts "a*o > #{star_delete("a*o")}"
puts "*dech* > #{star_delete("*dech*")}"
puts "de**po > #{star_delete("de**po")}"
puts "sa*n*ti > #{star_delete("sa*n*ti")}"
puts "abc > #{star_delete("abc")}"
puts "12**34 > #{star_delete("12**34")}"
