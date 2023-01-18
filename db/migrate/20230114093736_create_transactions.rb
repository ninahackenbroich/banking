class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.float :amount
      t.integer :transaction_type
      t.string :iban
      t.integer :transaction_status
      t.timestamps
      t.belongs_to :account, null: false, foreign_key: true
    end
  end
end
