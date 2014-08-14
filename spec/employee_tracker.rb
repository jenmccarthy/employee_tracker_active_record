require 'active_record'
require './lib/employee'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_coniguration = database_configuration['development']
ActiveRecord::Base.establish_connection(development_configuration)

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
  put "Here are all the employees: "
  employees = Employee.all
  employees.each { |employee| puts employee.name }
end

welcome
