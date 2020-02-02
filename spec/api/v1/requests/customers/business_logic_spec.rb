require 'rails_helper'

RSpec.describe 'Customers API business intelligence endpoint' do
  it 'can get merchant with most successful transactions for a customer' do
    customer = create(:customer)
    merchant_1 = create(:merchant)
    merchant_1 = create(:merchant)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_1 = create(:invoice, customer: customer, merchant: merchant_1)
    invoice_2 = create(:invoice, customer: customer, merchant: merchant_1)
    invoice_3 = create(:invoice, customer: customer, merchant: merchant_1)
    invoice_4 = create(:invoice, customer: customer, merchant: merchant_2)
    invoice_5 = create(:invoice, customer: customer, merchant: merchant_2)
    create(:transaction, invoice: invoice_1)
    create(:transaction, result: 'failed', invoice: invoice_2)
    create(:transaction, result: 'failed', invoice: invoice_3)
    create(:transaction, invoice: invoice_4)
    create(:transaction, invoice: invoice_5)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(merchant_2.id)
  end
end
