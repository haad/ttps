class Travel < ActiveRecord::Base
  has_many :players, through: :players_travels
  has_many :players_travels
  has_many :travel_tickets
  validates_presence_of :destination

  #accepts_nested_attributes_for :players, :travel_tickets
end
