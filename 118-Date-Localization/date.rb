def convert(replace)
  t = Time.now
  case replace
    when "%l" then t.usec/1000  
    when "%s" then t.sec.to_s 
    when "%m" then t.min.to_s
    when "%h" then t.hour>12 ? (t.hour-12).to_s : t.hour.to_s
    when "%H" then t.hour.to_s
    when "%c" then t.hour>12 ? "PM" : "AM"
    when "%d" then t.day.to_s
    when "%M" then t.mon.to_s
    when "%y" then t.year.to_s
    else "unknown"
  end
end

def date_local(input)
  puts input.gsub(/%\S/) {|x| convert(x)}
end

date_local("%s.%l")
date_local("%s:%m:%h %M/%d/%y")
date_local("The minute is %m! The hour is %h.")
date_local("%h.%H.%c")
