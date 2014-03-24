class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :destination
      t.text :description
      t.integer :cars_count
      t.integer :travel_costs
      t.integer :travel_distance
      t.date :travel_date

      t.timestamps
    end
  end
end

