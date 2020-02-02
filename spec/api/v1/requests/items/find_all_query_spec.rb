require 'rails_helper'

RSpec.describe 'Items API find all endpoints' do
  before :each do
    id = create(:merchant).id
    
    create_list(:item, 2)

    @item = create(
      :item,
      name: 'pencil',
      description: 'drawing',
      unit_price: '3.25',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-28 14:53:59',
      merchant_id: id
    )
  end

  it 'can find all records based on item id query' do
    get "/api/v1/items/find_all?id=#{@item.id}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(1)
    expect(items[:data].first[:id].to_i).to eq(@item.id)
  end

  it 'can find all records based on item name query' do
    get "/api/v1/items/find_all?name=#{@item.name}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(1)
    expect(items[:data].first[:id].to_i).to eq(@item.id)
  end

  it 'can find all records based on item description query' do
    get "/api/v1/items/find_all?description=#{@item.description}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(1)
    expect(items[:data].first[:id].to_i).to eq(@item.id)
  end

  it 'can find all records based on item unit_price query' do
    get "/api/v1/items/find_all?unit_price=#{@item.unit_price}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(1)
    expect(items[:data].first[:id].to_i).to eq(@item.id)
  end

  it 'can find all records based on item created_at query' do
    get "/api/v1/items/find_all?created_at=#{@item.created_at}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(1)
    expect(items[:data].first[:id].to_i).to eq(@item.id)
  end

  it 'can find all records based on item updated_at query' do
    get "/api/v1/items/find_all?updated_at=#{@item.updated_at}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(1)
    expect(items[:data].first[:id].to_i).to eq(@item.id)
  end

  it 'can find all records based on item merchant_id query' do
    get "/api/v1/items/find_all?merchant_id=#{@item.merchant_id}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(1)
    expect(items[:data].first[:id].to_i).to eq(@item.id)
  end
end
