# encoding: utf-8

def validurl(input)
  res=input.slice(/\?(.*)/)
  (res.nil?)?(return false):(res=res[1..-1].split("&"))
  res.each{|x|(puts "URL is invalid";return) unless x=~/^[a-zA-Z\-_.~=!*'();:@=+$,\/%#\[\]]*$/}
  res.each{|x|y=x.split("=");puts "#{y[0]}: #{y[1]}"}
end

validurl("http://en.wikipedia.org/w/index.php?title=Main_Page&action=edit")
validurl("http://en.wikipedia.org/w/index.php?title= hello world!&action=<")
validurl("http://en.wikipedia.org/w/index.php")
