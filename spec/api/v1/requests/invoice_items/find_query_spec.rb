require 'rails_helper'

RSpec.describe 'Invoice Items API find endpoints' do
  before :each do
    @invoice_item = create(:invoice_item)
  end

  it 'can find a record based on invoice_item id query' do
    get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find a record based on invoice_item item_id query' do
    get "/api/v1/invoice_items/find?item_id=#{@invoice_item.item_id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find a record based on invoice_item invoice_id query' do
    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item.invoice_id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find a record based on invoice_item quantity query' do
    get "/api/v1/invoice_items/find?quantity=#{@invoice_item.quantity}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find a record based on invoice_item unit_price query' do
    get "/api/v1/invoice_items/find?unit_price=#{@invoice_item.unit_price}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find a record based on invoice_item created_at query' do
    get "/api/v1/invoice_items/find?created_at=#{@invoice_item.created_at}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(@invoice_item.id)
  end

  it 'can find a record based on invoice_item updated_at query' do
    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item.updated_at}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(@invoice_item.id)
  end
end
