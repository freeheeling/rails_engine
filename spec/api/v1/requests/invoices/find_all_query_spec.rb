require 'rails_helper'

RSpec.describe 'Invoices API find all endpoints' do
  before :each do
    merchant_id = create(:merchant).id
    customer_id = create(:customer).id

    create_list(:invoice, 2)

    @invoice = create(
      :invoice,
      status: 'failed',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-28 14:53:59',
      merchant_id: merchant_id,
      customer_id: customer_id
    )
  end

  it 'can find all records based on invoice id query' do
    get "/api/v1/invoices/find_all?id=#{@invoice.id}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data]).to be_instance_of Array
    expect(invoices[:data].size).to eq(1)
    expect(invoices[:data].first[:id].to_i).to eq(@invoice.id)
  end

  it 'can find all records based on invoice status query' do
    get "/api/v1/invoices/find_all?status=#{@invoice.status}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data]).to be_instance_of Array
    expect(invoices[:data].size).to eq(1)
    expect(invoices[:data].first[:id].to_i).to eq(@invoice.id)
  end

  it 'can find all records based on invoice created_at query' do
    get "/api/v1/invoices/find_all?created_at=#{@invoice.created_at}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data]).to be_instance_of Array
    expect(invoices[:data].size).to eq(1)
    expect(invoices[:data].first[:id].to_i).to eq(@invoice.id)
  end

  it 'can find all records based on invoice updated_at query' do
    get "/api/v1/invoices/find_all?updated_at=#{@invoice.updated_at}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data]).to be_instance_of Array
    expect(invoices[:data].size).to eq(1)
    expect(invoices[:data].first[:id].to_i).to eq(@invoice.id)
  end

  it 'can find all records based on invoice customer_id query' do
    get "/api/v1/invoices/find_all?customer_id=#{@invoice.customer_id}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data]).to be_instance_of Array
    expect(invoices[:data].size).to eq(1)
    expect(invoices[:data].first[:id].to_i).to eq(@invoice.id)
  end

  it 'can find all records based on invoice merchant_id query' do
    get "/api/v1/invoices/find_all?merchant_id=#{@invoice.merchant_id}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data]).to be_instance_of Array
    expect(invoices[:data].size).to eq(1)
    expect(invoices[:data].first[:id].to_i).to eq(@invoice.id)
  end
end
