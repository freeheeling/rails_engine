require 'rails_helper'

RSpec.describe 'Invoice Items API realationship endpoints' do
  it 'gets the invoice associated with a given invoice_item' do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_data[:data][:id].to_i).to eq(invoice.id)
  end

  it 'gets the item associated with a given invoice_item' do
    item = create(:item)
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    invoice_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_data[:data][:id].to_i).to eq(item.id)
  end
end
