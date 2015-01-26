class CreateDivisions < ActiveRecord::Migration
  def change
    create_table(:divisions) do |d|
      d.column(:description, :string)

      d.timestamps
    end
    
  end
end
