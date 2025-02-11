class AddFieldsToTransactionEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :transaction_entries, :date, :date
    add_column :transaction_entries, :recurring, :integer
  end
end
