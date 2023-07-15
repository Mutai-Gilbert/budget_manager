class RenameTransactionTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :transactions_entries
  end
end
