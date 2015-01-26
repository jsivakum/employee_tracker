require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/division")
require("pg")

get('/') do
  @employees = Employee.all()
  erb(:index)
end

post('/employee') do
  name = params.fetch('name')
  @employee = Employee.create({:name => name})
  erb(:index)
end
