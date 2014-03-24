class RemoveTravelCostsfromTravel < ActiveRecord::Migration
  def change
    remove_column :travels, :travel_costs, :integer
  end
end
