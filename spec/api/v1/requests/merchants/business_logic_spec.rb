require 'rails_helper'

RSpec.describe 'Merchants API business intelligence endpoints' do
  it 'can get variable number of merchants ranked by total revenue' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)
    merchant_4 = create(:merchant)
    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_2)
    invoice_3 = create(:invoice, merchant: merchant_3)
    # invoice_4 = create(:invoice, merchant: merchant_4)
    create(:invoice_item, quantity: '3', unit_price: '1.00', invoice: invoice_1)
    create(:invoice_item, quantity: '2', unit_price: '2.00', invoice: invoice_2)
    create(:invoice_item, quantity: '1', unit_price: '2.50', invoice: invoice_3)
    # create(:invoice_item, quantity: '2', unit_price: '3.00', invoice: invoice_4)
    create(:transaction, invoice: invoice_1)
    create(:transaction, invoice: invoice_2)
    create(:transaction, invoice: invoice_3)
    # create(:transaction, result: 'failed', invoice: invoice_4)

    x = 3

    get "/api/v1/merchants/most_revenue?quantity=#{x}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].size).to eq(3)
    expect(merchants[:data][0][:id].to_i).to eq(merchant_2.id)
    expect(merchants[:data][1][:id].to_i).to eq(merchant_1.id)
    expect(merchants[:data][2][:id].to_i).to eq(merchant_3.id)
  end
end
