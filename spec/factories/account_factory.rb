require 'rails_helper'

FactoryBot.define do
    factory :account do
      client { Faker::TvShows::Friends.character}
      iban {Faker::Bank.iban(country_code: "de")}
      bic {Faker::Bank.swift_bic}
      balance {rand(0..1000000).to_f}
    end
 end
