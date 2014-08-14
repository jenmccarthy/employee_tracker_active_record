class CreateDivisionsEmployees < ActiveRecord::Migration
  def change
    create_table :divisions_employees do |t|
      t.column :employee_id, :integer
      t.column :division_id, :integer

      t.timestamps
    end
  end
end
