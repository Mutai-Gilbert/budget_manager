class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name, null: false, default: ''
      t.decimal :amount, default: 0
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
