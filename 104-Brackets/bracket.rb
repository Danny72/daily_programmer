def recur(input,stack)
    return true if stack.empty?
    if (input[0].ord==(stack[-1].ord)+2 or input[0].ord==(stack[-1].ord)+1) 
      stack.pop
      recur(input[1..-1],stack)  
    else
      return false if input[0]=~/[\]\}\>\)]/
      stack.push input[0]
      recur(input[1..-1],stack)
    end
end

def bracket(input)
  stack = []
  return true if input=~/^[^\[\]\{\}\(\)\<\>]*$/
  brackets = input.scan(/[\[\]\{\}\(\)\<\>]/).join('')
  puts brackets
  return false if brackets.length%2!=0
  stack.push(brackets[0])
  recur(brackets[1..-1],stack)
end

puts bracket("123")
puts bracket("(abc)")
puts bracket("()abc()")
puts bracket("[<{abc123abc}>]")
puts bracket("(abc[123)abc]")
puts bracket("(abc>")
puts bracket("<{[()]([[[]]])}>")
puts bracket("<{[(]([[[]]])}>")
puts bracket("<{[(]([[[]]])}>)")
puts bracket("<hello (world)[]>")
