require 'active_record'
require './lib/employee'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  puts 'Welcome to the employee tracker.'
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add an employee, 'l' to list an employee, or 'f' to mark an employee as fired"
    puts "Press 'x' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      add_employee
    when 'l'
      list_employees
    when 'f'
      mark_fired
    when 'x'
      puts 'Have a good day!'
    else
      puts 'That was not a valid option.'
    end
  end
end

def add_employee
  puts "What is his/her name?"
  employee_name = gets.chomp
  employee = Employee.new(name: employee_name)
  employee.save
  "'#{employee.name}'' has been saved to the system."
end

def list_employees
  puts "Here are all the employees: "
  Employee.current_employees.each { |employee| puts employee.name }
end

def mark_fired
  puts 'What employee is getting canned?'
  Employee.all.each { |employee| puts employee.name }
  fired_employee_name = gets.chomp
  fired_employee = Employee.where(name: fired_employee_name).first
  fired_employee.update(fired: true)
  puts "'#{fired_employee}' has been terminated"
end

welcome
