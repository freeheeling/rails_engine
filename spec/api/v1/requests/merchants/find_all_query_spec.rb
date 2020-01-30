require 'rails_helper'

RSpec.describe 'Merchants API find all endpoints' do
  before :each do
    create_list(:merchant, 2)

    @merchant = create(
      :merchant,
      name: 'A1',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-28 14:53:59'
    )
  end

  it 'can find all records based on merchant id query' do
    get "/api/v1/merchants/find_all?id=#{@merchant.id}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data]).to be_an Array
    expect(merchants[:data].size).to eq(1)
    expect(merchants[:data].first[:id].to_i).to eq(@merchant.id)
  end

  it 'can find all records based on merchant name query' do
    merchant = create(:merchant, name: 'A1')

    get "/api/v1/merchants/find_all?name=#{merchant.name}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data]).to be_an Array
    expect(merchants[:data].size).to eq(2)
    expect(merchants[:data].first[:id].to_i).to eq(@merchant.id)
    expect(merchants[:data].last[:id].to_i).to eq(merchant.id)
  end

  it 'can find all records based on merchant created_at query' do
    merchant = create(:merchant, created_at: '2012-03-27 14:53:59')

    get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data]).to be_an Array
    expect(merchants[:data].size).to eq(2)
    expect(merchants[:data].first[:id].to_i).to eq(@merchant.id)
    expect(merchants[:data].last[:id].to_i).to eq(merchant.id)
  end

  it 'can find all records based on merchant updated_at query' do
    merchant = create(:merchant, updated_at: '2012-03-28 14:53:59')

    get "/api/v1/merchants/find_all?updated_at=#{merchant.updated_at}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data]).to be_an Array
    expect(merchants[:data].size).to eq(2)
    expect(merchants[:data].first[:id].to_i).to eq(@merchant.id)
    expect(merchants[:data].last[:id].to_i).to eq(merchant.id)
  end
end
