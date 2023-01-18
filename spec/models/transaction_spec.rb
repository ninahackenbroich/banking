require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'association' do
    it { should belong_to(:account) }
  end
  describe 'validations' do
    it { should validate_presence_of(:transaction_type) }
    it { should validate_presence_of(:amount) }
  end
 end