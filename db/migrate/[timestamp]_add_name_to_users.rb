class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    # Add name column if it doesn't exist
    add_column :users, :name, :string unless column_exists?(:users, :name)
  end
end 