class CreateTransactionEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_entries do |t|
      t.string :name
      t.decimal :amount, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
