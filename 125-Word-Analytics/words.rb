def match_array(pattern)
  input = File.read("ascii_text.txt")
  return input.scan(pattern)
end

def match_array_num(pattern, n)
  match = match_array(pattern)
  match_count = Hash.new(0)
  match.each { |x| match_count[x] += 1 }
  return match_count.sort_by { |k,v| v }.reverse.to_a.take(n)
end

puts "#{match_array(/[a-zA-Z'-]+/).size} words"
puts "#{match_array(/\w/).size} letters"
puts "#{match_array(/[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/).size} symbols"

print "Top three most common words: "
com_words = match_array_num(/[a-zA-Z'-]+/, 3)
com_words.each { |x| print "#{x[0]} " }
puts ""

print "Top three most common letters: "
letters_count = match_array_num(/\w/, 3)
letters_count.each { |x| print "#{x[0]} " }
puts ""

para_word = match_array_num(/^([a-zA-Z'-]+)/, 1)
puts "\"#{para_word[0][0][0]}\" is the most common first word in all paragraphs"

print "Words only used once: "
words_count = match_array_num(/[a-zA-Z'-]+/, 9999999).select { |x| x[1] == 1 }
words_count.each { |x| print "#{x[0].downcase} " }
puts ""

print "Letters not used in the document: "
letters_not = match_array(/\w/).map{ |x| x.downcase }.uniq
letters_not = ("a".."z").select { |x| letters_not.index(x) == nil }.each { |x| print "#{x} " }
puts ""
