class AddHasManyAndBelongsToPlayer < ActiveRecord::Migration
  def change
      create_table :players_travels do |t|
        t.belongs_to :player
        t.belongs_to :travel
      end
  end
end
