class Criterium < ActiveRecord::Base
  attr_accessible :name
  
  has_many :renter_criteria
  has_many :renters, :through => :renter_criteria
  belongs_to :query
  
end
