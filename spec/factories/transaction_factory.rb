require 'rails_helper'
require 'date'

 #spec/factories/transaction.rb
 FactoryBot.define do
  factory :transaction do
    transaction_date { Faker::Date.between(from: 90.days.ago, to: Date.today)}
    amount {rand(0.00..1000.00)}
    transaction_status {rand(1..3)}
    transaction_type {rand(1..3)} 
    account { Account.first }
  end
 end