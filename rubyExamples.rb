#single line comment
=begin
This is a multi line
comment
=end

#Block vs Proc vs Lambda
=begin
A block is just a bit of code between do..end or {}. 
  It's not an object on its own, but it can be passed to methods like .each or .select.
  Proc is a saved block we can use over and over.
  Lambda is just like a proc, only it cares about the number of arguments it 
  gets and it returns to its calling method rather than returning immediately.
=end

#Get current time
time = Time.now

#Random number, here 10 is the max number it can be
myRand = rand(10)

#true & false, AND OR
is_true = 2 != 3
is_false = 2 == 3
# test_1 should be true
test_1 = 1 != 2
# test_2 = should be true
test_2 = true || false
# test_3 = should be false
test_3 = false && false

# Conditional assignemtn (only add variable if it isn't assigned already)
favorite_language ||= "PHP"

#string manipulation
puts "Mark".length
name = "Mark"
puts name.downcase.reverse.upcase
puts "timmy".capitalize!

#Get data, if, elsif, else & case (Ruby's answer to a switch statement)
puts "It's true!" if true #one line if statement
puts "It's true!" unless false #one line "unless", will always print "It's true!" since nothing has set things to false

print "Integer please: "
user_num = Integer(gets.chomp)
if user_num < 0
  puts "You picked a negative integer!"
elsif user_num > 0
  puts "You picked a positive integer!"
else
  puts "You picked zero!"
end

puts "Hello there!"
greeting = gets.chomp
case greeting
when "English"
  puts "Hello!"
when "French"
  puts "Bonjour!"
when "German"
  puts "Guten Tag!"
when "Finnish"
  puts "Haloo!"
else
  puts "I don't know that language!"
end

#Ternary operator
puts 1 < 2 ? "1 is less than 2!" : "1 is not less than 2."

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
  counter = counter + 1
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

array = [1, 2, 3, 4, 5]
array.each do |x|
  x += 10
  puts "#{x}"
end

odds = [1, 3, 5, 7, 9]
odds.each { |item| print item * 2 }

10.times { print "Chunky bacon!" }

#Arrays

demo_array = [100, 200, 300, 400, 500]
print demo_array[2] # Add your code here!

multi_d_array = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
multi_d_array.each { |x| puts "#{x}\n" }

my_hash = { "name" => "Eric",
            "age" => 26,
            "hungry?" => true }
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
           "Santa's Little Helper" => "dog" }
friends.each { |x| puts "#{x}" }
family.each { |x, y| puts "#{x}: #{y}" }

languages = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
languages.each { |element| puts element }

secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas",
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
  puts n ** 3 #cube is done via ** just like squaring something is ** 2
end

cubertino(8)

#Sort
books = ["C", "B", "A", "D"]
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
         "Nickname" => "Matz" }
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
  lion_king: 3.5,
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
  lion_king: 3.5,
}
movie_ratings.each_key { |k| puts "#{k}" }
movie_ratings.each_value { |v| puts "#{v}" }

movies = {
  StarWars: 4.8,
  Divergent: 4.7,
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
  Ishtar: 1,
}
puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."
choice = gets.chomp.downcase
case choice
when "add"
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
when "update"
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
when "display"
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when "delete"
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

my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
my_array.each { |num| puts num unless num % 2 != 0 }

#print numbers up to & down to 5, so 1 2 3 4 5 and 5 4 3 2 1, also works with letters eg A B C D
1.upto(5) { |num| print num, " " }
5.downto(1) { |num| print num, " " }
"A".upto("D") { |letter| print letter, " " }

#.respond_to? takes a symbol and returns true if an object can receive that method and false
age = 26
age.respond_to?(:next)

# << can be used instead of "push" on arrays and += on strings
alphabet = ["a", "b", "c"]
alphabet << "d" # Update me!
caption = "A giraffe surrounded by "
puts caption << "weezards!" # Me, too!

# doing this #{} is like casting so we convert something from the array into an actual string rather than .to_s
favorite_things = ["Ruby", "espresso", "candy"]
puts "A few of my favorite things:"
favorite_things.each do |thing|
  puts "I love #{thing}!"
end

#case aka "switch statement in JS & PHP"
puts "What's your favorite language?"
language = gets.chomp
case language
when "Ruby"
  puts "Ruby is great for web apps!"
when "Python"
  puts "Python is great for science."
when "JavaScript"
  puts "JavaScript makes websites awesome."
when "HTML"
  puts "HTML is what websites are made of!"
when "CSS"
  puts "CSS makes websites pretty."
else
  puts "I don't know that language!"
end

#Implicit Return (avoid having to use return statement)
def square(num)
  num * num
end

#Times example to avoid for loop
3.times do
  puts "I'm a refactoring master!"
end

#Class example
class Person
  def initialize(name)
    @name = name
  end
end

matz = Person.new("Yukihiro")

class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")
ruby.description
python.description
javascript.description

#Class with gloabl variable thanks to '$'
class MyClass
  $my_variable = "Hello!"
end

puts $my_variable

class Person
  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
  end
end

# .collect example
fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
double = Proc.new { |x| x * 2 }
doubled_fibs = fibs.collect(&double)
puts doubled_fibs

# .yield example, yield allows you to customise a method depending on your needs.
def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |n| puts "My name is #{n}." }
yield_name("Mark") { |n| puts "My name is #{n}." }

def double(num)
  yield(num * 2)
end

double(2) { |n| puts "My num is #{n}." }

#Proc (has the cool powers of an object but can also be used like a block)
#Proc objects are blocks of code that have been bound to a set of local variables. Once bound,
#the code may be called in different contexts and still access those variables.
multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end
print (1..100).to_a.select(&multiples_of_3)

#Using & allows us to treat a Proc like a block thus &round_down
floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
round_down = Proc.new { |x| x.floor }
ints = floats.collect(&round_down)
print ints

# Here at the amusement park, you have to be four feet tall
# or taller to ride the roller coaster. Let's use .select on
# each group to get only the ones four feet tall or taller.
group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]
# Complete this as a new Proc
over_4_feet = Proc.new { |height| height >= 4 }
# Change these three so that they use your new over_4_feet Proc
can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)
can_ride_3 = group_3.select(&over_4_feet)
puts can_ride_1
puts can_ride_2
puts can_ride_3

def greeter
  yield
end

phrase = Proc.new { puts "Hello there!" }
greeter(&phrase)

#.call (you can use this to call a Proc instead of the &myProc solution)
hi = Proc.new { puts "Hello!" }
hi.call

#Procs & symbols
numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.map(&:to_s)
puts strings_array

#Lambda (a lot like a Proc)
=begin
Like procs, lambdas are objects. The similarities don't stop there: with the exception of a bit of syntax and 
a few behavioral quirks, lambdas are identical to procs.

lambda checks the number of arguments passed to it, while a proc does not
when a lambda returns, it passes control back to the calling method; when a proc returns, 
it does so immediately, without going back to the calling method
=end
def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })

strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |x| x.to_sym }
symbols = strings.collect(&symbolize)
print symbols

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" } #Batman will win! for Proc
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!" #Iron Man will win! for Lambda
end

puts batman_ironman_lambda

#lambda using .is_a? to check a type (such as a Symbol)
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda { |x| x.is_a? Symbol }
symbols = my_array.select(&symbol_filter)
my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
puts symbols

#pull out all the Ints
odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]
ints = odds_n_ends.select { |x| x.is_a? Integer }
puts ints

#use Proc & .select to filter out those under 100
ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]
under_100 = Proc.new { |x| x < 100 }
youngsters = ages.select(&under_100)
puts youngsters

#lambda that checks for letters before M
crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher",
}
first_half = lambda { |x, y| y < "M" }
a_to_m = crew.select(&first_half)
puts a_to_m

#Class
class Language
  def initialize(name, creator)
    @name = name
    @creator = creator
  end

  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")
ruby.description
python.description
javascript.description

#Count numbers of person instances (created objects)
class Person
  # Set your class variable to 0 on line 3
  @@people_count = 0

  def initialize(name)
    @name = name
    # Increment your class variable on line 8
    @@people_count += 1
  end

  def self.number_of_instances
    # Return your class variable on line 13
    return @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")
puts "Number of Person instances: #{Person.number_of_instances}"

def create_record(attributes, raise_error = false)
  record = build_record(attributes)
  yield(record) if block_given?
  saved = record.save
  set_new_record(record)
  raise RecordInvalid.new(record) if !saved && raise_error
  record
end

#Class inheritence (Grab the super class' abilities)
class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

#Override superclass
class Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Punch to the chops!"
  end
end

class Dragon < Creature
  def fight
    return "Breathes fire!"
  end
end

#Override sub class method with superclasses
class Creature
  def initialize(name)
    @name = name
  end

  def fight
    return "Punch to the chops!"
  end
end

class Dragon < Creature
  def fight
    puts "Instead of breathing fire. . . "
    super
  end
end

#set instances to variables
class Message
  def initialize(from, to)
    @from = from
    @to = to
  end
end

#class variable @@
class Message
  @@messages_sent = 0

  def initialize(from, to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end

my_message = Message.new("Mio", "Meow")

#use super class' parameters in sub class
class Message
  @@messages_sent = 0

  def initialize(from, to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end

my_message = Message.new("Mio", "Meow")

class Email < Message
  def initialize(from, to)
    super
  end
end

class Computer
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created at #{time} by #{@username}. "
  end
end

#Class example
class Computer
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created at #{time} by #{@username}. "
  end

  def Computer.get_users
    @@users
  end
end

my_computer = Computer.new("user", "pass")

#attr_reader & attr_writer (getters & setters for Ruby)
class Person
  attr_reader :name
  attr_writer :job

  def initialize(name, job)
    @name = name
    @job = job
  end
end

#attr_accessor is a getter & setter al in 1
class Person
  attr_reader :name
  attr_accessor :job

  def initialize(name, job)
    @name = name
    @job = job
  end
end

#module is ruby's answer to packages/namespaces where we store classes you can't create instances
#& can't have subclasses they're more like folders
module Circle
  PI = 3.141592653589793
  def Circle.area(radius)
    PI * radius ** 2
  end
  def Circle.circumference(radius)
    2 * PI * radius
  end
end

#Constants example
#Ruby constants are written in ALL_CAPS and are separated with underscores if there's more than one word
module MyLibrary
  FAVE_BOOK = "Bret Hart"
end

#we use :: as the scope resolution operator so we use the correct constant from the correct module (essentially namespacing like in C#)
module Math
  PI = 3.14
end

puts Math::PI

#require just like "require" in PHP, use an external file
require "date"
puts Date.today

#include allows you to pull in anything from a module so you don't have to bother writing Math::cos, just cos will do
class Angle
  include Math
  attr_accessor :radians

  def initialize(radians)
    @radians = radians
  end

  def cosine
    cos(@radians)
  end
end

acute = Angle.new(1)
acute.cosine

#mixin - module is used to mix additional behavior and information into a class, it's called a mixin
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")
peter.jump
jiminy.jump

#Mixins are the neartest this we have to multiple inheritance
module MartialArts
  def swordsman
    puts "I'm a swordsman."
  end
end

class Ninja
  include MartialArts

  def initialize(clan)
    @clan = clan
  end
end

class Samurai
  include MartialArts

  def initialize(shogun)
    @shogun = shogun
  end
end

#extends (just like C# & Java) use extends rather than includes if you want to use a Class rather than an instance of a class
module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? "PM" : "AM"} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now

#mixin example via include
module Languages
  FAVE = "Ruby"
end

class Master
  include Languages

  def initialize; end

  def victory
    puts FAVE
  end
end

total = Master.new
total.victory

#Banking Class example
class Account
  attr_reader :name, :balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end

  def withdraw(pin_number, amount)
    if pin_number == pin
      @balance -= amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  private

  def pin
    @pin = 1234
  end

  def pin_error
    "Access denied: incorrect PIN."
  end
end

checking_account = Account.new("Mark", 20)
