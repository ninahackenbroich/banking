require "rails_helper"

RSpec.describe 'Accounts', type: :request do
  # initialize test data
  let!(:account) { create(:account) }
  let!(:accounts) {create_list(:account, 3)}

  let!(:account_id) { account.id }
  # Test suite for GET /account/:id
  describe 'GET /account/:id' do
    before { get "/accounts/#{account_id}" }

    it 'returns account balance' do
      expect(json['balance']).to eq(account.balance)
    end

    it 'returns max. 10 transactions' do
      expect(json['transactions'].count).to be <= 10
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end