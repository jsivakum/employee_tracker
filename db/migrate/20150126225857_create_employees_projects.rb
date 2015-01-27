class CreateEmployeesProjects < ActiveRecord::Migration
  def change
    create_table :employees_projects do |ep|
      ep.column :project_id, :integer
      ep.column :employee_id, :integer
      ep.timestamps
    end
  end
end
