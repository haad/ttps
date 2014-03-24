class Travel < ActiveRecord::Base
  has_many :players, through: :players_travels
  has_many :players_travels
  has_many :travel_tickets
  validates_presence_of :destination

  def travel_costs
    costs = 0
    unless travel_tickets.nil?
      travel_tickets.each do |tt|
        costs += tt.ticket_sum
      end
    end
    costs
  end
  #accepts_nested_attributes_for :players, :travel_tickets
end
