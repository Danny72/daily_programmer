def no_repeat(start_y,end_y)
  return (start_y..end_y).select{|x| x.to_s.split('').uniq!.nil?}
end

puts no_repeat(1980,1987)
