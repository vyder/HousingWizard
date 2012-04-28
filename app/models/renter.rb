class Renter < ActiveRecord::Base
  
  has_many :renter_departments
  has_many :renter_criteria
  has_many :departments, :through => :renter_departments
  has_many :criteria, :through => :renter_criteria
  
end
