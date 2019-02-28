#single line comment
=begin
This is a multi line
comment
=end

#true & false, AND OR
is_true = 2 != 3
is_false = 2 == 3
# test_1 should be true
test_1 = 1 != 2
# test_2 = should be true
test_2 = true || false
# test_3 = should be false
test_3 = false && false


#string manipulation
puts "Mark".length
name = "Mark"
puts name.downcase.reverse.upcase
puts "timmy".capitalize!


#Get data, if, elsif, else & case (Ruby's answer to a switch statement)
puts "It's true!" if true #one line if statement

print "Integer please: "
user_num = Integer(gets.chomp)
if user_num < 0
  puts "You picked a negative integer!"
elsif user_num > 0
  puts "You picked a positive integer!"
else
  puts "You picked zero!"
end

case language
when "JS"
  puts "Websites!"
when "Python"
  puts "Science!"
when "Ruby"
  puts "Web apps!"
else
  puts "I don't know!"
end


#unless
hungry = false
unless hungry
  puts "I'm writing Ruby programs!"
else
  puts "Time to eat!"
end


#Loops
counter = 1
while counter < 11
  puts counter
  counter = counter + 1
end

counter = 1
until counter > 10
  puts counter
  # Add code to update 'counter' here!
  counter = counter +1
end

for k in 1..50
  print k
end

i = 20
loop do
  i -= 1
  next if i % 2 != 0
  print "#{i}"
  break if i <= 0
end

array = [1,2,3,4,5]
array.each do |x|
  x += 10
  puts "#{x}"
end

odds = [1,3,5,7,9]
odds.each { |item| print item*2 }

10.times { print "Chunky bacon!" }


#Arrays

demo_array = [100, 200, 300, 400, 500]
print demo_array[2] # Add your code here!

multi_d_array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
multi_d_array.each { |x| puts "#{x}\n" }

my_hash = { "name" => "Eric",
  "age" => 26,
  "hungry?" => true
}
puts my_hash["name"]

pets = Hash.new
pets["Stevie"] = "cat"
puts pets["Stevie"]


friends = ["Milhouse", "Ralph", "Nelson", "Otto"]
family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}
friends.each { |x| puts "#{x}" }
family.each { |x, y| puts "#{x}: #{y}" }

languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
languages.each { |element| puts element }

secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas"
}
secret_identities.each do |hero, name|
  puts "#{hero}: #{name}"
end


#Methods
def array_of_10
  puts (1..10).to_a
end
array_of_10

def cubertino(n)
  puts n ** 3 #cube is done via **
end
cubertino(8)


#Sort
books = ["C","B","A","D"]
books.sort!

fruits = ["orange", "apple", "banana", "pear", "grapes"]
fruits.sort! do |firstBook, secondBook|
  secondBook <=> firstBook
end

=begin
The combined comparison operator <=>. 
Returns 0 if the first operand (item to be compared) equals the second, 
1 if the first operand is greater than the second, and 
-1 if the first operand is less than the second.
=end

#Hashes
matz = { "First name" => "Yukihiro",
  "Last name" => "Matsumoto",
  "Age" => 47,
  "Nationality" => "Japanese",
  "Nickname" => "Matz"
}
matz.each do |key, value|
  puts value
end

no_nil_hash = Hash.new("Never nil!")

#Symbols
#Old symbol style
my_first_symbol = :my_symbol

symbol_hash = {
  :one => 1,
  :two => 2,
  :three => 3,
}

:sasquatch.to_s
# ==> "sasquatch" 
"sasquatch".to_sym
# ==> :sasquatch    OR use intern since Ruby gives you annoying options
"hello".intern
# ==> :hello


#modern symbol doesn't need "=>" & the ":" is put at the end
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
good_movies = movie_ratings.select { |name, rating| rating > 3 }

movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 3,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
movie_ratings.each_key { |k| puts "#{k}"}
movie_ratings.each_value { |v| puts "#{v}"}



movies = {
  StarWars: 4.8, 
  Divergent: 4.7
  }

puts "What would you like to do? "

choice = gets.chomp

case choice
when "add"
  puts "What movie would you like to add? "
  title = gets.chomp
  puts "What rating does the movie have? "
  rating = gets.chomp
  movies[title.to_sym] = rating.to_i
when "update"
  puts "Updated!"
when "display"
  puts "Movies!"
when "delete"
  puts "Deleted!"
else
  puts "Error!"
end


#CRUD
movies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}
puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."
choice = gets.chomp.downcase
case choice
when 'add'
  puts "What movie do you want to add?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "What's the rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been added with a rating of #{rating}."
  else
    puts "That movie already exists! Its rating is #{movies[title.to_sym]}."
  end
when 'update'
  puts "What movie do you want to update?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating? (Type a number 0 to 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with new rating of #{rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when 'delete'
  puts "What movie do you want to delete?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "#{title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end


