require "time"

day, month, year = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i
days_since_start = (Date.new(year, month, day, Date::GREGORIAN) - Date.new(-3113, 8, 11, Date::GREGORIAN)).to_i
num = [144000,7200,360,20,20]
print "#{days_since_start/num[0]}."   
days_left = days_since_start%num[0]
for i in 1..4
  if i == 4 
    print days_left
    puts ""
  else
    print "#{days_left/num[i]}."
    days_left = days_left%num[i]
  end
end
