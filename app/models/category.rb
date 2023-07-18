class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :transaction_entries
  has_one_attached :icons

  validates :name, presence: true
  validates :icon, presence: true
end
