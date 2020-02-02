require 'rails_helper'

RSpec.describe 'Items API relationship endpoints' do
  it 'gets a collection of invoice items associated with a specific item' do
    item = create(:item)
    create_list(:invoice_item, 2, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items).to be_instance_of Hash
    expect(invoice_items[:data].size).to eq(2)
    expect(invoice_items[:data].first[:type]).to eq('invoice_item')
  end
end
