# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'
require 'faker'

puts "Destroy all 💥"

Transaction.destroy_all
Account.destroy_all

puts "Creating 6 Accounts"

6.times do |i|
  Account.create!(iban: Faker::Bank.iban(country_code: "de"), bic: Faker::Bank.swift_bic, client: Faker::TvShows::Friends.character, balance: rand(0..1000000))
end

puts "Transactions creating"

Account.all.each do |acc|
  10.times do |i|
    Transaction.create!(transaction_date: Faker::Date.between(from: 90.days.ago, to: Date.today), amount: rand(0.00..1000.00), transaction_type: rand(1..3), transaction_status: rand(1..3), account: acc)
  end
end

puts "Getting Transactions Type: Transfer"

transactions = Transaction.where(transaction_type: 3)

transactions.each do |trans|
  receiving_accounts = Account.select { |a| a != trans.account}
  rec_acc = receiving_accounts.sample
  trans.iban = rec_acc.iban
  trans.save
end

puts "Seeding completed 💸💸💸"

