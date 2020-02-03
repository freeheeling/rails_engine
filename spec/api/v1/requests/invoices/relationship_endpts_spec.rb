require 'rails_helper'

RSpec.describe 'Invoices API realationship endpoints' do
  it 'gets a collection of transactions associated with a given invoice' do
    invoice = create(:invoice)
    create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions).to be_instance_of Hash
    expect(transactions[:data].size).to eq(2)
    expect(transactions[:data].first[:type]).to eq('transaction')
  end

  it 'gets a collection of invoice items associated with a given invoice' do
    invoice = create(:invoice)
    create_list(:invoice_item, 2, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items).to be_instance_of Hash
    expect(invoice_items[:data].size).to eq(2)
    expect(invoice_items[:data].first[:type]).to eq('invoice_item')
  end
end
