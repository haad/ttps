class AddHasManyThroughToPlayersAndTravels < ActiveRecord::Migration
  def change
      create_table :players_travels do |t|
        t.belongs_to :player
        t.belongs_to :travel
        t.boolean :driver
      end

    add_index :players_travels, :player_id
    add_index :players_travels, :travel_id
  end
end
