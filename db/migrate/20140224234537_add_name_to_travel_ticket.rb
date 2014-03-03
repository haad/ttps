class AddNameToTravelTicket < ActiveRecord::Migration
  def change
    add_column :travel_tickets, :name, :string
  end
end
