class Travel < ActiveRecord::Base
  has_many :players, through: :players_travels
  has_many :players_travels
  has_many :travel_tickets
  has_many :payments
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

  def payments_costs
    costs = 0
    unless payments.nil?
      payments.each do |tt|
        costs += tt.payment_amount
      end
    end
    costs
  end

  def dest_with_date
    "#{destination} #{travel_date.inspect}"
  end
  #accepts_nested_attributes_for :players, :travel_tickets
end
