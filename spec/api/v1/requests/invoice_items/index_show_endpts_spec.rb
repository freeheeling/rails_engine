require 'rails_helper'

RSpec.describe 'Invoice Items API index and show endpoints' do
  it 'can get a list of all invoice_items' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data].size).to eq(3)
  end

  it 'can get a specific invoice_item by id' do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(id)
  end
end
