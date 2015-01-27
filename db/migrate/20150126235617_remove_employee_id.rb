class RemoveEmployeeId < ActiveRecord::Migration
  def change
    remove_column(:projects, :employee_id)
  end
end
