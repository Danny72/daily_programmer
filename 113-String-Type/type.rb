def type_check(input)
  puts case input
    when /^[+-]?\d+$/ then "int" 
    when /^\d+\.+\d+$/ then "float"
    when /^\d+-{1}\d+-{1}\d+$/ then "date"
    else "text"
  end
end

type_check("+345")
type_check("123.456")
type_check("20-11-2012")
type_check("Hello, world")
type_check("----")
