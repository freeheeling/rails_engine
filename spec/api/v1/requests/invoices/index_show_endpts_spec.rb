require 'rails_helper'

RSpec.describe 'Invoices API index and show endpoints' do
  it 'can get a list of all invoices' do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].size).to eq(3)
  end

  it 'can get a specific invoice by id' do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(id)
  end
end
