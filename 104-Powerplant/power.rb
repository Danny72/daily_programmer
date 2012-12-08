def op_days(days)
  (1..days).inject(0) {|sum,x| (x%3==0 or x%14==0 or x%100==0) ? sum : sum+1}
end

puts op_days ARGV[0].to_i

