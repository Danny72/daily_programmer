def gen_word 
  word = ""
  limit = 0
  alphabet = "aaaabbccddeeeffghiiijklmnooopqrstuuvwxyz            "
  while limit < 5 do
    word << alphabet[rand(0..51)]
    limit += 1
    return word.chomp word[-1] if word[-1] == " "
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
  puts word if doc=~/,#{word},/ and word.length > 3
end
