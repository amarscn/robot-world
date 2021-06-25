require 'timeloop' #Using timeloop library for looping in a time period

require 'pg'

def Basic_Structure_Assembly()
    conn  = PG.connect(
        dbname: "Car_Factory",
        port: 5432,
        user: "amardeep",
        password: ENV['pass']
    )
    
    # Generating cars and adding parts for first stage of Assembly
    Timeloop.every 60.seconds, maximum: 10.times do# Making sure the basic assembly only assembles 10 cars per minute
        model_id    = rand(1..10)
        year    = Time.at(rand * Time.now.to_i).year
        costprice   = rand(2500..35000)
        saleprice   = costprice+rand(2500..4500)
        conn.exec_params(
            "insert into car (model_id,year,cost_price,part_id,assembly_stage_id,sale_price)
            values ($1, $2, $3, $4, $5,$6);",
            [
            model_id,
            year,
            costprice,
            2,
            1,
            saleprice
            
            ])
        car_id  = conn.exec("SELECT max(id) from car").getvalue(0,0)
        for i in 1..4 do
            conn.exec_params(
                "insert into car_parts(car_id,part_id)
                values($1,$2);",
                [
                    car_id,
                    i
                ]
            )
            
        end
        
        
    end
    
end

# This method will move the car from the basic structure assembly stage to 
#  the Electronic Assembly Stage

def Electronic_Assembly
    conn2  = PG.connect(
        dbname: "Car_Factory",
        port: 5432,
        user: "amardeep",
        password: ENV['pass']
    )
    puts "Electronic Assembly started"
    Timeloop.every 60.seconds, maximum: 10.times do # Making sure the Electronic assembly only assembles 10 cars per minute
        cars    = conn2.exec("select id from car where assembly_stage_id=1");
        cars.each do |cars|
            car_id  = cars['id']
            conn2.exec_params(
                "Update car set assembly_stage_id=$1 where id=$2",
                [
                    2,
                    car_id
                ]
            )
            for i in 5..8 do
                conn2.exec_params(
                    "insert into car_parts(car_id,part_id)
                    values($1,$2);",
                    [
                        car_id,
                        i
                    ]
                )
                
            end
        end

    end
  

end

# This method will move the car from the Electronic assembly stage to 
#  the Final Painting Stage
 def Final_painting
    conn3  = PG.connect(
        dbname: "Car_Factory",
        port: 5432,
        user: "amardeep",
        password: ENV['pass']
    )
    puts "Final Assembly started"
    Timeloop.every 60.seconds, maximum: 10.times do # Making sure the Final assembly  only assembles 10 cars per minute
        cars    = conn3.exec("select id from car where assembly_stage_id=2");
        cars.each do |cars|
            car_id  = cars['id']
            conn3.exec_params(
                "Update car set assembly_stage_id=$1 where id=$2",
                [
                    3,
                    car_id
                ]
            )
            for i in 9..10 do
                conn3.exec_params(
                    "insert into car_parts(car_id,part_id)
                    values($1,$2);",
                    [
                        car_id,
                        i
                    ]
                )
                
            end
            conn3.exec_params(
                "Update car set is_complete=$1 where id=$2",
                [
                    'true',
                    car_id
                ]
            )
        end

    end
     
end

def Factory_Stock_Mover
    puts "Moving completed stock to Factory"
    conn4  = PG.connect(
        dbname: "Car_Factory",
        port: 5432,
        user: "amardeep",
        password: ENV['pass']
    )
    Timeloop.every 10.seconds do
        finished_cars   = conn4.exec("select id,model_id from car where moved_to_factory = false and is_complete = true");
        
        finished_cars.each do |finished_cars|
            model_id    = finished_cars['model_id']

            current_stock   = conn4.exec_params(
                "select total_stock from factory_stock where model_id=$1",
            [
                model_id
            ])
                if current_stock.ntuples==0
                    puts "No existing stock"
                    updatestock=1
                    conn4.exec_params(
                        "insert into factory_stock(model_id,total_stock)
                            values($1,$2);",
                            [
                                finished_cars['model_id'],
                                updatestock
                            ])
                    next
                end
                stock   = current_stock.getvalue 0,0
                updatenewstock = stock.to_i
                updatenewstock+=1
                puts updatenewstock
                conn4.exec_params("update factory_stock set total_stock=$1 where model_id=$2",
                [
                    updatenewstock,
                    model_id
                ])
                
                conn4.exec_params(
                    "Update car set moved_to_factory=$1 where id=$2",
                    [
                        'true',
                        finished_cars['id']
                    ]
                )
                end

            
                     
        end
    

     
end

def Generate_random_defects
    puts "Generating random defects in cars"
    conn5  = PG.connect(
        dbname: "Car_Factory",
        port: 5432,
        user: "amardeep",
        password: ENV['pass']
    )
    Timeloop.every 60.seconds, maximum: 5.times do
        car_stock   = conn5.exec("select id from car where moved_to_factory=true")
        if car_stock.ntuples==0
            next
        end
        defect_car_array    = []
        car_stock . each do |car_stock|
            defect_car_array.push(car_stock['id'])
        end
        max_stock   = car_stock.getvalue(0,0).to_i
        defect_car_id   = defect_car_array.sample
        defect_car_part_id  = rand(1..10)
        begin

            model_id   = conn5.exec_params("select model_id from car where id= $1",
            [
                defect_car_id
            ])
            model_id    = model_id.getvalue(0,0).to_i

            conn5.exec_params(
                "insert into car_defect(car_id,part_id,model_id)
                values($1,$2,$3);",
                [
                    defect_car_id,
                    defect_car_part_id,
                    model_id
                ]
            )
            
        rescue PG:: Error=> e
            # puts e.message
        ensure
            next
            
        end
        
    end

end


puts "Generating Cars..."
puts "Basic Assembly Structure started..."
#Using threads to run Assemblies in parallel
t1  = Thread.new{Basic_Structure_Assembly()}
t2  = Thread.new{Electronic_Assembly()}
t3  = Thread.new{Final_painting()}
t4  = Thread.new{Factory_Stock_Mover()}
t5  = Thread.new{Generate_random_defects()}
t1.join
t2.join
t3.join
t4.join
t5.join


