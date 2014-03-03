class AddSurnameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :surname, :string
  end
end
