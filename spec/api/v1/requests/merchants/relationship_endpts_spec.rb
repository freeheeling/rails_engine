require 'rails_helper'

RSpec.describe 'Merchants API relationship endpoints' do
  it 'gets a collection of items associated with a specific merchant' do
    merchant = create(:merchant)
    create_list(:item, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items).to be_instance_of Hash
    expect(items[:data].count).to eq(2)
    expect(items[:data].first[:type]).to eq('item')
  end

  it 'gets a collection of invoices associated with a specific merchant' do
    customer = create(:customer)
    merchant = create(:merchant)
    create_list(:invoice, 2, customer: customer, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices).to be_instance_of Hash
    expect(invoices[:data].size).to eq(2)
    expect(invoices[:data].first[:type]).to eq('invoice')
  end
end
