####################################################
# The Robot Builder Class
####################################################
require 'timeloop' #Using timeloop library for looping in a time period

require 'pg'

#Using Ruby Builder pattern to define script for the Robot Car Builder

class StandardCarBuilder
  attr_reader :car
  
  def initialize
    @car = ''
  end
  
  def build_car_chasis() # Function to build car in "basic Structure Assembly Stage"
    conn  = PG.connect(
      dbname: "robot_car_factory",
      port: 5432,
      user: "amardeep",
      password: ENV['pass']
    )
    


  end
  
  def add_engine(res)
    puts res
  end
  
  def add_front_wheels(res)
    car << "  with two front wheels\n"
  end
  def add_back_wheels(res)
    car << "  with two back wheels\n"
  end
  
  def add_laser(res)
    car << "  with a dashboard\n"
  end
  
  def add_computer(res)
    # car << "  with a fuel tank\n"
  end
  def add_seats(res)
    # car <<"Seats"
  end

end

# Builder Class to construct cars

class CarConstructionDirector
  def construct_car(builder:)
    res = builder.build_car_chasis()
    builder.add_engine(res)
    builder.add_front_wheels(res)
    builder.add_back_wheels(res)
    builder.add_laser(res)
    builder.add_computer(res)
    builder.add_seats(res)
    builder.car
  end
end
construction_director = CarConstructionDirector.new
car_builder = StandardCarBuilder.new

Timeloop.every 10.seconds, maximum: 4.times do 
  new_car = construction_director.construct_car(builder: car_builder)
  puts new_car  
 end


  