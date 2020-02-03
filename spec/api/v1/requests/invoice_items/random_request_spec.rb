require 'rails_helper'

RSpec.describe 'Invoice Items API random endpoint' do
  it 'can get a random invoice item' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items/random'

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item).to be_instance_of Hash
    expect(invoice_item[:data][:type]).to eq('invoice_item')
  end
end
