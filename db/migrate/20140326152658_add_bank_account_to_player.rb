class AddBankAccountToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :bank_account, :string
  end
end
