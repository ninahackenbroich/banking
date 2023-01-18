require "rails_helper"
require "date"


RSpec.describe 'Transactions', type: :request do
  # initialize test data
  let!(:account) { create(:account) }
  let!(:account_id) { account.id }

  # binding.pry

  describe 'POST accounts/:account_id/transactions/:id' do

    let(:params) do 
      {"account_id": Account.first.id, "transaction": {"amount": 9000, "iban": Account.last.iban,"transaction_type": "transfer", "transaction_status": "approved"}}
    end

    context 'when request attributes are valid' do
      before { post "/accounts/#{Account.first.id}/transactions", params: params}
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/accounts/#{Account.first.id}/transactions", params: {} }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a failure message' do
        expect(response.body).to include("param is missing or the value is empty: transaction")
      end
    end

  end
end