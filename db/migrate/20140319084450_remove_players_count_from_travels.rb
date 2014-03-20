class RemovePlayersCountFromTravels < ActiveRecord::Migration
  def change
    remove_column :travels, :players_count, :integer
  end
end
