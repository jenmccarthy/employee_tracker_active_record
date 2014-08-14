class AddFiredEmployeeToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :fired, :boolean
  end
end
