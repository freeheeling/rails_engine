require 'rails_helper'

RSpec.describe 'Merchants API business intelligence endpoints' do
  before :each do
    customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @merchant_4 = create(:merchant)
    @invoice_1 = create(:invoice, merchant: @merchant_1)
    invoice_2 = create(:invoice, merchant: @merchant_2)
    invoice_3 = create(:invoice, merchant: @merchant_3)
    invoice_4 = create(:invoice, merchant: @merchant_4, customer: customer_1)
    invoice_5 = create(:invoice, merchant: @merchant_4, customer: @customer_2)
    invoice_6 = create(:invoice, merchant: @merchant_4, customer: @customer_2)
    create(:invoice_item, quantity: '3', unit_price: '1.00', invoice: @invoice_1)
    create(:invoice_item, quantity: '2', unit_price: '2.00', invoice: invoice_2)
    create(:invoice_item, quantity: '1', unit_price: '2.50', invoice: invoice_3)
    # create(:invoice_item, quantity: '2', unit_price: '3.00', invoice: invoice_4)
    create(:transaction, invoice: @invoice_1)
    create(:transaction, invoice: invoice_2)
    create(:transaction, invoice: invoice_3)
    create(:transaction, invoice: invoice_4)
    create(:transaction, invoice: invoice_5)
    create(:transaction, invoice: invoice_6)
    # create(:transaction, result: 'failed', invoice: invoice_4)
  end

  it 'can get a variable number of merchants ranked by total revenue' do
    get "/api/v1/merchants/most_revenue?quantity=3"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].size).to eq(3)
    expect(merchants[:data][0][:id].to_i).to eq(@merchant_2.id)
    expect(merchants[:data][1][:id].to_i).to eq(@merchant_1.id)
    expect(merchants[:data][2][:id].to_i).to eq(@merchant_3.id)
  end

  it 'can get total revenue across all merchants for a given date' do
    get "/api/v1/merchants/revenue?date=#{@invoice_1.created_at}"

    total_revenue = InvoiceItem.all.map { |inv| inv.quantity * inv.unit_price }.sum
    revenue = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(revenue[:data][:attributes][:total_revenue].to_f).to eq(total_revenue)
  end

  it 'can get customer with most successful transactions for a merchant' do
    get "/api/v1/merchants/#{@merchant_4.id}/favorite_customer"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer_2.id)
  end
end
