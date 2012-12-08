def wake_time(input)
  t=Time.now
  time = Time.new(t.year,t.month,t.day,input.split(".")[0].to_i,input.split(".")[1].to_i)
  res = []
  6.times {|x| res << time-(60*90) and time=time-(60*90) }
  res.drop(2).reverse.each {|x| puts x.strftime("%I:%M")}
end

wake_time('6.15')
