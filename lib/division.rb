class Division < ActiveRecord::Base
  has_and_belongs_to_many :employees

  # def self.current_divisions
  #   where({name => self.name})
  # end

end
