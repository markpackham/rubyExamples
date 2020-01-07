# Normal Array
names = ['Ada', 'Belle', 'Chris']
puts names
puts "1st name: " + names[0]
puts "2nd name: " + names[1]
puts "3rd name: " + names[2]
# puts "4th name doesn't exist so we get a nil aka null error " + names[3]  # This is out of range.

# Each loop through array (essentially For Each)
# Only use "do" for iterators
languages = ['English', 'German', 'Ruby']
languages.each do |lang|
  puts 'I love ' + lang + '!'
  puts 'Don\'t you?'
end
puts 'And let\'s hear it for C++!'
puts '...'

# This is like a For Loop
3.times do
    puts 'Repeat me 3 times!'
end

# Showing the difference between Arrays and Strings
foods = ['artichoke', 'brioche', 'caramel']
puts foods
puts
puts foods.to_s
puts
puts foods.join(', ')
puts
puts foods.join('  :)  ') + '  (I AM NOT A SEPERATOR!!!! :( )))'

# Push and Pop, same as other languages with Stacks of Dishes
favorites = []
favorites.push 'raindrops on roses'
favorites.push 'whiskey on kittens'

puts favorites[0]
puts favorites.last
puts favorites.length

puts favorites.pop
puts "I just just got rid of the last thing I added via pop so I'm stuck with this - " + favorites.to_s
puts favorites.length