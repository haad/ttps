class AddHasManyThroughToPlayersAndTravels < ActiveRecord::Migration
  def change
      create_table :players_travels do |t|
        t.belongs_to :player
        t.belongs_to :travel
        t.boolean :driver
      end
  end
end
