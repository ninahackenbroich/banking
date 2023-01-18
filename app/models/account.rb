class Account < ApplicationRecord
  has_many :transactions
 
  validates :iban, presence: true
end
