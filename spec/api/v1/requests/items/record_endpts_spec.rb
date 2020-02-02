require 'rails_helper'

RSpec.describe 'Items API record endpoints' do
  it 'can get a list of all items' do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].size).to eq(3)
  end
end
