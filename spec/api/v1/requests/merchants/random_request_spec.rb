require 'rails_helper'

RSpec.describe 'Merchants API random endpoint' do
  it 'can get a random merchant' do
    create_list(:merchant, 3)

    get '/api/v1/merchants/random'

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant).to be_instance_of Hash
    expect(merchant[:data][:type]).to eq('merchant')
  end
end
