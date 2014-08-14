require 'active_record'
require './lib/employee'
require './lib/division'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  puts 'Welcome to the employee tracker.'
  menu
end

def menu
  choice = nil
  until choice == 'x'
    puts "'a' to add an employee"
    puts "'l' to list an employee"
    puts "'f' to mark an employee as fired"
    puts "'c' to create a division"
    puts "'d' to list out divisions"
    puts "Press 'x' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      add_employee
    when 'c'
      add_division
    when 'l'
      list_employees
    when 'f'
      mark_fired
    when 'd'
      list_divisions
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
  employee = Employee.new(name: employee_name, fired: false)
  employee.save
  "'#{employee_name}' has been saved to the system."
end

def add_division
  puts "What is the name of this division?"
  division_name = gets.chomp
  division = Division.new(name: division_name)
  division.save
  "'#{division_name}' has been saved to the system."
end

def list_employees
  puts "Here are all the employees: "
  Employee.current_employees.each { |employee| puts employee.name }
end

def list_divisions
  puts "Here are all of the divisions within this company"
  Division.all.each { |division| puts division.name }
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
