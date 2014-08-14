require 'spec_helper'

describe Employee do

  # it { should have_and_belong_to_many :divisions }

  it 'can return the all the employees that still work here' do
    current_employees = (1..5).to_a.map { |number| Employee.create(name: "employee #{number}", fired: false)}
    fired_employee = Employee.create(name: 'fired_employee', fired: true)
    expect(Employee.current_employees).to eq current_employees
  end
end
