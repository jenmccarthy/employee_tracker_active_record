class Employee < ActiveRecord::Base
  # has_and_belongs_to_many :divisions

  def self.current_employees
    where(fired: false)
  end
end
