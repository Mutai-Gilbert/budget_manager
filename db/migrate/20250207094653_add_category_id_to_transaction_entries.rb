class AddCategoryIdToTransactionEntries < ActiveRecord::Migration[7.0]
  def change
    add_reference :transaction_entries, :category, foreign_key: true
  end
end
