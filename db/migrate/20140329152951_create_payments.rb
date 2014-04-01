class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :payment_amount
      t.string :name
      t.integer :player_id
      t.integer :travel_id

      t.timestamps
    end

    add_index :payments, :player_id
    add_index :payments, :travel_id
  end
end
