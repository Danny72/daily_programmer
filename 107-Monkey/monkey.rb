def gen_word
  word = ""
  limit = 0
  while limit < 5 do
    word << (rand(1..29)+64).chr.to_s.downcase
    limit += 1
    return word.chomp word[-1] if word[-1]=~/[\[\]\\]/
  end
  limit = 0
  return word
end

start = Time.now
doc = File.read('dic.txt')
doc = doc.split("\r\n").join(",")
puts "Dictionary Loaded in #{Time.now - start}"
while true
  word = gen_word
  puts word if doc=~/,#{word},/ and word.length > 2
end
