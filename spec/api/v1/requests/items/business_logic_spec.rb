require 'rails_helper'

RSpec.describe 'Items API business intelligence endpoints' do
  it 'can get top variable number of items ranked by total revenue generated' do
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    invoice_3 = create(:invoice)
    create(:invoice_item, quantity: '1', unit_price: '3.00', item: item_1, invoice: invoice_1)
    create(:invoice_item, quantity: '2', unit_price: '2.00', item: item_2, invoice: invoice_2)
    create(:invoice_item, quantity: '1', unit_price: '1.50', item: item_3, invoice: invoice_3)
    create(:transaction, result: 'failed', invoice: invoice_1)
    create(:transaction, invoice: invoice_2)
    create(:transaction, invoice: invoice_3)

    get '/api/v1/items/most_revenue?quantity=2'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data]).to be_instance_of Array
    expect(items[:data].size).to eq(2)
    expect(items[:data].first[:id].to_i).to eq(item_2.id)
    expect(items[:data].last[:id].to_i).to eq(item_3.id)
  end

  xit 'gets date with most sales for a given item based on invoice date' do
    item = create(:item)
    invoice_1 = create(:invoice, created_at: '2014-03-27')
    invoice_2 = create(:invoice, created_at: '2014-03-27')
    invoice_3 = create(:invoice, created_at: '2014-04-27')
    invoice_4 = create(:invoice, created_at: '2014-04-27')
    invoice_5 = create(:invoice, created_at: '2014-05-27')
    create(:invoice_item, item: item, invoice: invoice_1)
    create(:invoice_item, item: item, invoice: invoice_2)
    create(:invoice_item, item: item, invoice: invoice_3)
    create(:invoice_item, item: item, invoice: invoice_4)
    create(:invoice_item, item: item, invoice: invoice_5)
    create(:transaction, invoice: invoice_1)
    create(:transaction, result: 'failed', invoice: invoice_2)
    create(:transaction, invoice: invoice_3)
    create(:transaction, result: 'failed', invoice: invoice_4)
    create(:transaction, invoice: invoice_5)

    get "/api/v1/items/#{item.id}/best_day"

    date = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(date[:data][:attributes][:best_day]).to eq(invoice_5.created_at)
  end
end
