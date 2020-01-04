# to float
puts '15'.to_f
puts '99.999'.to_f
# to int
puts '99.999'.to_i
puts ''
puts '5 is my favorite number!'.to_i # only gives 5 since it has no idea what the other stuff following is
puts 'Who asked you about 5 or whatever?'.to_i # gives 0 since it has no idea what the first thing is
puts 'Your momma did.'.to_f # gives 0.0, no idea what the strings are
puts ''
# to string
puts 'stringy'.to_s
puts 3.to_i


=begin 15.0
99.999 
99     
       
5      
0      
0.0    
       
stringy
3  
=end