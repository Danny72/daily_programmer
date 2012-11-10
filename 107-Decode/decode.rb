def decode(input,output)
  if (input.length > 1) & (input.slice(0..1).to_i < 27)
    decode(input.slice(2..-1), output + (input.slice(0..1).to_i+64).chr.to_s)
  end
  if input.length > 0
    decode(input.slice(1..-1), output + (input.slice(0).to_i+64).chr.to_s)
  else
    puts output.downcase
  end
end

decode(ARGV[0],"")
