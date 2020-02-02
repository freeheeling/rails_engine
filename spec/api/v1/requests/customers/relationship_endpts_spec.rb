require 'rails_helper'

RSpec.describe 'Customers API relationship endpoints' do
  it 'gets a collection of invoices associated with a specific customer' do
    customer = create(:customer)
    create_list(:invoice, 2, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices).to be_instance_of Hash
    expect(invoices[:data].size).to eq(2)
    expect(invoices[:data].first[:type]).to eq('invoice')
  end

  it 'gets a collection of transactions associated with a specific customer' do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/customers/#{customer.id}/transactions"

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions).to be_instance_of Hash
    expect(transactions[:data].size).to be(2)
    expect(transactions[:data].first[:type]).to eq('transaction')
  end
end
