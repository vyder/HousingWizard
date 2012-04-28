class Department < ActiveRecord::Base
  attr_accessible :name, :abbr
  
  has_many :renter_departments
  has_many :renters, :through => :renter_departments
end
