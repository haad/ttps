class Travel < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :travel_tickets
  validates_presence_of :destination

  #accepts_nested_attributes_for :players, :travel_tickets
end
