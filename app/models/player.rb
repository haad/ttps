class Player < ActiveRecord::Base
  has_and_belongs_to_many :travels
  has_many :travel_tickets
  validates_uniqueness_of :name
  validates_uniqueness_of :email
  validates_uniqueness_of :phone

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone
end
