require 'timeloop'
Timeloop.every 10.seconds, maximum: 4.times do 
    puts "Hello"
   end
   
   # Result:
   
   # 0
   # 1
   # 2
   # 3
   # => 4
   
   Timeloop.every 'second', maximum: 3 do |i|
    puts 'You will see me only 3 times.'
   end
   
   # Result:
   
   # You will see me only 3 times.
   # You will see me only 3 times.
   # You will see me only 3 times.
   # => 3
   