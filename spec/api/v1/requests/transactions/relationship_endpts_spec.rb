require 'rails_helper'

RSpec.describe 'Transactions API realationship endpoints' do
  it 'gets invoice associated with a given transaction' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    transaction_invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction_invoice[:data][:id].to_i).to eq(invoice.id)
  end
end
