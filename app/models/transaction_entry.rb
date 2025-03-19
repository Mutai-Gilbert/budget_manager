class TransactionEntry < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true

  enum recurring: { one_time: 0, monthly: 1 }
end
