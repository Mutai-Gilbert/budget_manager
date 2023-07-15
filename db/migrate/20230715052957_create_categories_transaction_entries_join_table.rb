class CreateCategoriesTransactionEntriesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_transaction_entries, id: false do |t|
      t.references :category, null: false, foreign_key: true
      t.references :transaction_entry, null: false, foreign_key: true
    end
  end
end
