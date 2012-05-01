class Renter < ActiveRecord::Base
  
  # Relationships
  has_many :renter_departments
  has_many :renter_criteria
  has_many :departments, :through => :renter_departments
  has_many :criteria, :through => :renter_criteria

  # Scopes
  scope :lives_oncampus, where('renters.oncampus = ?', true)
  scope :lives_offcampus, where('renters.oncampus = ?', false)
  scope :has_roommate, where('renters.roommate = ?', true)
  scope :lives_alone, where('renters.roommate = ?', false)
  scope :from_department, lambda { |abbr| joins(:departments).where("departments.abbr = ?", abbr) }
  scope :has_criterium, lambda { |criterium| joins(:criteria).where("criteria.name = ?", criterium) }
  scope :low_rent, where('renters.rent = ?', 1)
  scope :mid_rent, where('renters.rent = ?', 2)
  scope :high_rent, where('renters.rent = ?', 3)
  
end
