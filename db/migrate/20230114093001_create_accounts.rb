class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :iban
      t.string :bic
      t.string :client
      t.float :balance
      t.timestamps
    end
  end
end
