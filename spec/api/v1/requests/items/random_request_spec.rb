require 'rails_helper'

RSpec.describe 'Items API random endpoint' do
  it 'cant get a random item' do
    create_list(:item, 3)

    get '/api/v1/items/random'

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item).to be_instance_of Hash
    expect(item[:data][:type]).to eq('item')
  end
end
