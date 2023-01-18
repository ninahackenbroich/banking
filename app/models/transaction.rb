class Transaction < ApplicationRecord
  belongs_to :account
  
  validates :transaction_type, :amount, presence: true

  enum :transaction_type, {withdraw: 1, deposit: 2, transfer: 3}
  enum :transaction_status, {approved: 1, declined: 2, pending: 3, canceled: 4}
end
