letters = 'aAbBcCdDeE'
puts letters.upcase
puts letters.downcase
puts letters.swapcase
puts letters.capitalize # only effects first letter
puts ' a'.capitalize
puts letters
=begin 
AABBCCDDEE
aabbccddee
AaBbCcDdEe
Aabbccddee
 a        
aAbBcCdDeE 
=end

# reverse
var1 = 'stop'
puts var1.reverse

# spacing
lineWidth = 40
str = '--> text <--'
puts str.ljust  lineWidth
puts str.center lineWidth
puts str.rjust  lineWidth
puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)

# length
puts 'What is your name?'
name = gets.chomp
puts 'Did you know there are ' + name.length.to_s +
     ' characters in your name (obviously character so numbers or spaces include & not just letters), ' + name + '?'

