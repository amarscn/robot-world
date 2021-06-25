# This process will check for defective cars and what defects there are and report on Slack
require 'net/http' 
require 'json'
require 'uri'
require 'pg'
require 'timeloop' #Using timeloop library for looping in a time period

# uri = URI('https://hooks.slack.com/services/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')
# Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
#   request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
#   request.body = {parameter: 'value'}.to_json
#   response = http.request request # Net::HTTPResponse object
#   puts "response #{response}"
# end


def Guard_Bot_Stock_Mover # This function will move non-defective stock to store from factory
    conn  = PG.connect(
        dbname: "Car_Factory",
        port: 5432,
        user: "amardeep",
        password: ENV['pass']
    )
    Timeloop.every 30.minutes  do
            defects = conn.exec("select count(*) as total, model_id from car_defect group by model_id")

        defects.each do |defects|
        current_stock    = conn.exec_params('select total_stock from factory_stock where model_id=$1',
            [
                defects['model_id']
            ])
            unless current_stock.ntuples !=0
                next
            else
                current_stock   = current_stock.getvalue(0,0).to_i
                stock_to_store  = current_stock - defects['total'].to_i
                if stock_to_store !=0
                    existing_store_stock    = conn.exec_params("select total_stock from store_stock where model_id=$1",
                    [
                        defects['model_id']
                    ])
                    if  existing_store_stock.ntuples==0
                        conn.exec_params(
                            "insert into store_stock(model_id,total_stock)
                                values($1,$2);",
                                [
                                    defects['model_id'],
                                    stock_to_store
                                ])
                        factory_update_stock    = current_stock - stock_to_store
                        conn.exec_params("update factory_stock set total_stock=$1 where model_id=$2",
                        [
                            factory_update_stock,
                            defects['model_id']
                        ])
                        next
                    end
                    store_stock_update = existing_store_stock.getvalue(0,0).to_i+stock_to_store
                    new_factory_stock   = current_stock - store_stock_update
                    conn.exec_params("update store_stock set total_stock=$1 where model_id=$2",
                        [
                            store_stock_update,
                            defects['model_id']
                        ])

                        conn.exec_params("update factory_stock set total_stock=$1 where model_id=$2",
                            [
                                new_factory_stock,
                                defects['model_id']
                            ])

                    
                end
                
            end
            
        
        end    
    
    
    end
    

    
end


def Guard_Robot_Defect_Logger
    
end

Guard_Bot_Stock_Mover()
