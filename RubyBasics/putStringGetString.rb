# put out the string and get the string you enter from your keyboard
# use chomp to remove the return at the end
puts 'Hello there, and what\'s your name?'
name = gets.chomp
puts 'Your name is ' + name + '?  What a lovely name!'
puts 'Pleased to meet you, ' + name + '.  :)'

# without chomp the Return would be picked up causing a line space
=begin 
Your name is Mark
?  What a lovely name!
Pleased to meet you, Mark
.  :) 
=end