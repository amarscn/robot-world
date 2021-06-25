conn  = PG.connect(
    dbname: "Car_Factory",
    port: 5432,
    user: "amardeep",
    password: ENV['pass']
)