require 'rails_helper'


RSpec.describe Account, type: :model do
  describe 'associations' do
    it { should have_many(:transactions) }
  end
  describe 'validations' do
    it { should validate_presence_of(:iban) }
  end
 end