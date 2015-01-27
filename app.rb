require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/division")
require("./lib/project")
require("pg")

get('/') do
  @divisions = Division.all()
  erb(:index)
end

post('/employee') do
  @division = Division.find(params.fetch("division_id"))
  @employee = @division.employees.create({:name => params.fetch('name')})
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

get('/employees/:id') do
  @employee = Employee.find(params.fetch("id").to_i())
  @projects = @employee.projects
  erb(:employee)
end

post('/project') do
  @employee = Employee.find(params.fetch("employee_id").to_i())
  project = @employee.projects.create({:description => params.fetch("description")})
  @projects = @employee.projects
  erb(:employee)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id"))
  @employees = Employee.all()
  @project_employees = @project.employees
  erb(:project)
end

post('/add_employee') do
  @project = Project.find(params.fetch("project_id"))

  @employees = Employee.all()
  @project_employees = @project.employees
  employee = Employee.find(params.fetch("employee_id").to_i())
  @project.employees << employee

  erb(:project)
end
