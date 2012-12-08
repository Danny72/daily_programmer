def sort_dates(input)
  puts input.scan(/([^ ].*?:\d*:\d*)/).sort
end

sort_dates("2012 12 02 23:02:12 1899 03 02 14:04:42 1969 07 20 02:25:30 2019 11 02 00:13:01")
