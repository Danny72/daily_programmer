def hex(input)
  count, line = 0, 0
  input.each_byte do |x|
    if count%18 == 0
      puts ""
      print line.to_s(16).rjust(8,"0")
      line += 1
    end
    if sprintf("%02x",x).upcase! 
      print " #{sprintf("%02x",x)}".upcase 
    else
      print " #{sprintf("%02x",x)}"
    end
    count += 1
  end
  puts ""
end

input = File.read(ARGV[0])
hex(input)
