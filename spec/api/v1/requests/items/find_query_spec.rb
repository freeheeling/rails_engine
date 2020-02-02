require 'rails_helper'

RSpec.describe 'Items API find endpoints' do
  before :each do
    @item = create(:item)
  end

  it 'can find a record based on item id query' do
    get "/api/v1/items/find?id=#{@item.id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'can find a record based on item name query' do
    get "/api/v1/items/find?name=#{@item.name}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'can find a record based on item description query' do
    get "/api/v1/items/find?description=#{@item.description}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'can find a record based on item unit_price query' do
    get "/api/v1/items/find?unit_price=#{@item.unit_price}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'can find a record based on item created_at query' do
    get "/api/v1/items/find?created_at=#{@item.created_at}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'can find a record based on item updated_at query' do
    get "/api/v1/items/find?updated_at=#{@item.updated_at}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end
end
