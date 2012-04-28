class RenterCriterium < ActiveRecord::Base
  attr_accessible :criterium_id, :renter_id
  
  belongs_to :criterium
  belongs_to :renter
end
