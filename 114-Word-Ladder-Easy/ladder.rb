def ladder(input,dic)
  return false if input.length != 4
  word = input.dup

  input.split("").each_index do |i| 
    ('a'..'z').each do |x| 
      word[i]=x 
      puts word if dic.include? word and word != input
    end
    word = input.dup
  end
end

dic = File.open("dic.txt").map {|x| x.strip!}
ladder("puma",dic)
