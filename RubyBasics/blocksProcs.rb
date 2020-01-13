# block of code (code in between do and end)
# proc is a procedure that can take parameters like a method
# procs can be chucked into methods and methods can return procs
doYouLike = Proc.new do |aGoodThing|
    puts 'I *really* like '+aGoodThing+'!'
  end
  doYouLike.call 'chocolate'
  doYouLike.call 'ruby'
# I *really* like chocolate!
# I *really* like ruby!



# A method using Procs as parameters
def compose proc1, proc2
    Proc.new do |x|
      proc2.call(proc1.call(x))
    end
  end
  
  squareIt = Proc.new do |x|
    x * x
  end
  
  doubleIt = Proc.new do |x|
    x + x
  end
  
  doubleThenSquare = compose doubleIt, squareIt
  squareThenDouble = compose squareIt, doubleIt
  
  puts doubleThenSquare.call(5) # 100 so (5+5) squared
  puts squareThenDouble.call(5) # 50 so (5 squared) + (5 squared)



# getting the time taken of various Blocks
  def profile descriptionOfBlock, &block
    startTime = Time.now
  
    block.call # call a block of code, eg a count to 100
  
    duration = Time.now - startTime
  
    puts descriptionOfBlock+':  '+duration.to_s+' seconds'
  end
  
  profile '25000 doublings' do
    number = 1
  
    25000.times do
      number = number + number
    end
  
    # Show the number of digits in this HUGE number.
    puts number.to_s.length.to_s+' digits'
  end
  
  profile 'count to a million' do
    number = 0
  
    1000000.times do
      number = number + 1
    end
  end
# 7526 digits
# 25000 doublings:  0.0300134 seconds
# count to a million:  0.0374972 seconds


# "yield" has the power of block.call with (&block)
def doItTwice
    yield
    yield
  end
  
  doItTwice do
    puts 'buritiate mustripe lablic acticise'
  end

  def doItTwice(&block) # same effect as method above
    block.call
    block.call
  end
  
  doItTwice do
    puts 'buritiate mustripe lablic acticise'
  end