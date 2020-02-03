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

  it 'gets a collection of items associated with a given invoice' do
    invoice = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    create(:invoice_item, invoice: invoice, item: item_1)
    create(:invoice_item, invoice: invoice, item: item_2)

    get "/api/v1/invoices/#{invoice.id}/items"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items).to be_instance_of Hash
    expect(items[:data].length).to eq(2)
    expect(items[:data].first[:type]).to eq('item')
  end

  it 'gets the customer associated with a given invoice' do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/customer"

    invoice_customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_customer[:data][:id].to_i).to eq(customer.id)
  end

  it 'gets the merchant associated with a given invoice' do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    invoice_merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_merchant[:data][:id].to_i).to eq(merchant.id)
  end
end
