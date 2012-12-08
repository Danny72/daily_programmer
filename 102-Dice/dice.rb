def dice_roll(input)
  dice = input.scan(/(\d*)d(\d*)([-+])?(\d*)?/)[0]
  dice[0] = 1 if dice[0]==""
  dice[3] = 0 if dice[2]==""
  result = 0
  dice[0].to_i.times {result += rand(1..dice[1].to_i)}
  dice.include?('+') ? result+dice[3].to_i : result-dice[3].to_i
end

puts dice_roll('10d6-2')
puts dice_roll('d20+7')
puts dice_roll('d8')
