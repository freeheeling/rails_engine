require 'rails_helper'

RSpec.describe 'Invoices API random endpoint' do
  it 'can get a random invoice' do
    create_list(:invoice, 3)

    get '/api/v1/invoices/random'

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice).to be_instance_of Hash
    expect(invoice[:data][:type]).to eq('invoice')
  end
end
