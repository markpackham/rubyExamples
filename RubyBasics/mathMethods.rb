# doing the power of and dealing with modulous
puts 5**2
puts 5**0.5
puts 7/3
puts 7%3
puts 365%7
# absolute value of a number
puts((5-2).abs)
puts((2-5).abs)
# random numbers
# SEED the random number algorithm first
srand 1776 
puts(rand(100))
# using Math object's methods
puts(Math::PI) # notice PI and E require "::" rather than "."
puts(Math::E)
puts(Math.cos(Math::PI/3))
puts(Math.tan(Math::PI/4))
puts(Math.log(Math::E**2))
puts((1 + Math.sqrt(5))/2)

=begin 
25
2.23606797749979
2
1
1
3
3
24
3.141592653589793
2.718281828459045
0.5000000000000001
0.9999999999999999
2.0
1.618033988749895 
=end