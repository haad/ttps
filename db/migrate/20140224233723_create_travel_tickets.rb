class CreateTravelTickets < ActiveRecord::Migration
  def change
    create_table :travel_tickets do |t|
      t.string :ticket_img
      t.string :name
      t.integer :ticket_sum
      t.belongs_to :travel
      t.belongs_to :player

      t.timestamps
    end
  end
end
