class RenterDepartment < ActiveRecord::Base
  attr_accessible :department_id, :renter_id
  
  belongs_to :renter
  belongs_to :department
  
end
