require 'rails_helper'

RSpec.describe 'Invoice Items API find all endpoints' do
  before :each do
    item_id = create(:item).id
    invoice_id = create(:invoice).id

    create_list(:invoice_item, 2)

    @invoice_item = create(
      :invoice_item,
      quantity: '0',
      unit_price: '01.23',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-28 14:53:59',
      item_id: item_id,
      invoice_id: invoice_id
    )
  end

  it 'can find all records based on invoice_iotem id query' do
    get "/api/v1/invoice_items/find_all?id=#{@invoice_item.id}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data]).to be_instance_of Array
    expect(invoice_items[:data].size).to eq(1)
    expect(invoice_items[:data].first[:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find all records based on invoice_item item_id query' do
    get "/api/v1/invoice_items/find_all?item_id=#{@invoice_item.item_id}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data]).to be_instance_of Array
    expect(invoice_items[:data].size).to eq(1)
    expect(invoice_items[:data].first[:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find all records based on invoice_item invoice_id query' do
    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice_item.invoice_id}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data]).to be_instance_of Array
    expect(invoice_items[:data].size).to eq(1)
    expect(invoice_items[:data].first[:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find all records based on invoice_item quantity query' do
    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item.quantity}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data]).to be_instance_of Array
    expect(invoice_items[:data].size).to eq(1)
    expect(invoice_items[:data].first[:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find all records based on invoice_item unit_price query' do
    get "/api/v1/invoice_items/find_all?unit_price=#{@invoice_item.unit_price}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data]).to be_instance_of Array
    expect(invoice_items[:data].size).to eq(1)
    expect(invoice_items[:data].first[:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find all records based on invoice_item created_at query' do
    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item.created_at}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data]).to be_instance_of Array
    expect(invoice_items[:data].size).to eq(1)
    expect(invoice_items[:data].first[:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find all records based on invoice_item updated_at query' do
    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item.updated_at}"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data]).to be_instance_of Array
    expect(invoice_items[:data].size).to eq(1)
    expect(invoice_items[:data].first[:id].to_i).to eq(@invoice_item.id)
  end
end
