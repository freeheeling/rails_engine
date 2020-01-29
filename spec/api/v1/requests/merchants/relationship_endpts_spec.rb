require 'rails_helper'

RSpec.describe 'Merchants API relationship endpoints' do
  it 'gets a collection of items associated with a specific merchant' do
    merchant = create(:merchant)
    create_list(:item, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].count).to eq(2)
  end
end
