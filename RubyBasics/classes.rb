# Time class
time  = Time.new   # The moment I generated this web page.
time2 = time + 60  # One minute later.
puts time
puts time2
puts Time.mktime(2000, 1, 1)          # Y2K.
puts Time.mktime(1976, 8, 3, 10, 11)  # Date and Time

# Hash Class (pretty much a key & value array)
colorArray = []  # same as Array.new
colorHash  = {}  # same as Hash.new

colorArray[0]         = 'red'
colorArray[1]         = 'green'
colorArray[2]         = 'blue'
colorHash['strings']  = 'red'
colorHash['numbers']  = 'green'
colorHash['keywords'] = 'blue'

colorArray.each do |color|
  puts color
end
colorHash.each do |codeType, color|
  puts codeType + ':  ' + color
end

# Random dice class
class Die

    def roll
      1 + rand(6)
    end
  
  end
  
  # Let's make a couple of dice...
  dice = [Die.new, Die.new]
  
  # ...and roll them.
  dice.each do |die|
    puts die.roll
  end





  class Die

    def initialize
      # I'll just roll the die, though we
      # could do something else if we wanted
      # to, like setting the die with 6 showing.
      roll
    end
  
    def roll
      @numberShowing = 1 + rand(6)
    end
  
    def showing
      @numberShowing
    end
  
  end
  
  puts Die.new.showing