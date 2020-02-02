require 'rails_helper'

RSpec.describe 'Merchants API find endpoints' do
  before :each do
    @merchant =  create(:merchant)
  end

  it 'can find a record based on merchant id query' do
    get "/api/v1/merchants/find?id=#{@merchant.id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(@merchant.id)
  end

  it 'can find a record based on merchant name query' do
    get "/api/v1/merchants/find?name=#{@merchant.name}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(@merchant.id)
  end

  it 'can find a record based on merchant created_at query' do
    get "/api/v1/merchants/find?created_at=#{@merchant.created_at}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(@merchant.id)
  end

  it 'can find a record based on merchant updated_at query' do
    get "/api/v1/merchants/find?updated_at=#{@merchant.updated_at}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(@merchant.id)
  end
end
