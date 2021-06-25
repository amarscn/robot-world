# This process will buy random number of cars each minute
require'pg'
require'timeloop'  #Using timeloop library for looping in a time period



def Robot_buyer
    conn  = PG.connect(
        dbname: "Car_Factory",
        port: 5432,
        user: "amardeep",
        password: ENV['pass']
    )
    Timeloop.every 60.seconds, maximum: 10.times do
        model_id  =  conn.exec("select id from model")
        model_id.each do |model_id|
            rand_model  = rand(1..model_id['id'].to_i) # Generate random car model from existing models
            puts rand_model
            car_stock  =  conn.exec_params("select total_stock from store_stock where model_id=$1",
            [
                rand_model
            ])
            if  car_stock.ntuples==0
                puts "Model Not in stock"
                next
            end

            conn.exec_params(
                "insert into car_order (model_id)
                values ($1);",
                [
                    rand_model
                ])
            
        end    
    end
    
end

Robot_buyer()