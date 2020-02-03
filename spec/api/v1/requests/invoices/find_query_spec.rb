require 'rails_helper'

RSpec.describe 'Invoices API find endpoints' do
  before :each do
    @invoice = create(:invoice)
  end

  it 'can find a record based on invoice id query' do
    get "/api/v1/invoices/find?id=#{@invoice.id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'can find a record based on invoice status query' do
    get "/api/v1/invoices/find?status=#{@invoice.status}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'can find a record based on invoice created_at query' do
    get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'can find a record based on invoice updated_at query' do
    get "/api/v1/invoices/find?updated_at=#{@invoice.updated_at}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end
end
