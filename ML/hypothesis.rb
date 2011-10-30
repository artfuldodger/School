#!/usr/bin/env ruby

puts "h(x) = t0 + t1x"
print "t0 = "
theta_zero = gets.to_f
print "t1 = "
theta_one = gets.to_f
puts "=========="
puts "h(x) = #{theta_zero} + #{theta_one}x"
puts "=========="
while true do
  print "x = "
  x = gets.to_f
  puts "h(#{x}) = #{theta_zero + (theta_one * x)}"
end
