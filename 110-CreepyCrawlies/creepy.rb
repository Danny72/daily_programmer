require 'net/http'
require 'rexml/document'

url = "http://www.reddit.com/r/nosleep.rss"
xml = Net::HTTP.get_response(URI.parse(url)).body
doc = REXML::Document.new(xml)

output = []

doc.elements.each("rss/channel/item/title") do |e|
  output << "===#{ e.text}===\n"
  output << e.next_element.next_element.next_element.next_element.text + "\n"
end

file = File.open("output.txt","w") 

output.each { |e| file.write e }
