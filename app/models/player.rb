class Player < ActiveRecord::Base
  has_many :travels, through: :players_travels
  has_many :players_travels
  has_many :travel_tickets
  has_many :payments

  validates_uniqueness_of :name
  validates_uniqueness_of :email
  validates_uniqueness_of :phone
  validates_uniqueness_of :bank_account

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :bank_account
  validates_presence_of :surname

  def name_with_surname
    "#{name} #{surname}"
  end
end
