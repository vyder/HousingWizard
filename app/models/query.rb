class Query < ActiveRecord::Base
  
  belongs_to :department
  has_many :criteria
  
  def calculate
    
    
    
  end
  
end
