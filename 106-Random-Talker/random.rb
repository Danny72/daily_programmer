def distinct_words(input)
  words = input.scan(/\w+|[".,:;!?()\[\]\{\}]/)
  count = Hash.new 0
  words.each {|x| count[x] = count[x] + 1}
  sorted = count.sort_by {|k,v| v}.reverse!.take(10)
  sorted.each {|k,v| puts "#{k}: #{v}"} 
end

file = File.read('kafka.txt').downcase
distinct_words(file)

