require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/division")
require("./lib/project")
require("pg")

get('/') do
  @employees = Employee.all()
  erb(:index)
end

post('/employee') do
  name = params.fetch('name')
  division_id = params.fetch('division_id')
  @division = Division.find(division_id)
  @employee = @division.employees.create({:name => name})
  @employees = @division.employees
  erb(:division)
end

post('/division') do
  description = params.fetch('description')
  @division = Division.create({:description => description})
  @divisions = Division.all()
  erb(:index)
end

get('/divisions/:id') do
  @division = Division.find(params.fetch("id").to_i)
  @employees = @division.employees
  erb(:division)
end
