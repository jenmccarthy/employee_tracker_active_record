class AddColumnsToDivisionsEmployees < ActiveRecord::Migration
  def change
    add_column :divisions_employees, :employee_id, :integer
    add_column :divisions_employees, :division_id, :integer
  end
end
