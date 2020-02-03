require 'rails_helper'

RSpec.describe 'Items API index and show endpoints' do
  it 'can get a list of all items' do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].size).to eq(3)
  end

  it 'can get a specific item by id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(id)
  end
end
