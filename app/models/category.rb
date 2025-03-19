class Category < ApplicationRecord
  belongs_to :user
  has_many :transaction_entries

  validates :name, presence: true
  # Remove icon validation if you don't have the column yet
  # validates :icon, presence: true
end
