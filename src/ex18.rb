# this one is like your scripts with argv
def puts_two(*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# ok, that *args is actually pointless, we can just do this
def puts_two_again(arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# this just takes one argument
def puts_one(arg1)
  puts "arg1: #{arg1}"
end

# this one takes no arguments
def puts_none()
  puts "I got noghin'."
end

puts_two("zed", "shaw")
puts_two_again("zed", "shaw")
puts_one("first!")
puts_none()
