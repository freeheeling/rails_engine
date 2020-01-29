require 'rails_helper'

RSpec.describe 'Merchants API record endpoints' do
  it 'can get a list of merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].count).to eq(3)
    expect(merchants[:data].first[:attributes]).to include(:name)
  end
end
