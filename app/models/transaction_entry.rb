class TransactionEntry < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
