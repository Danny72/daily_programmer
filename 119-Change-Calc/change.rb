def change(amount)
  amount = (amount.to_f*100).to_i
  change = {}
  {quarters:25,dimes:10,nickels:5,pennies:1}.each do |k,v|
    remain = amount%v
    change[k] = amount/v  if amount != remain
    amount = remain
  end
  return change
end

change(ARGV[0]).each{|k,v| puts "#{k}: #{v}"}
