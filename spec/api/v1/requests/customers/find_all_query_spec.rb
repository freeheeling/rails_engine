require 'rails_helper'

RSpec.describe 'Customers API find all endpoints' do
  before :each do
    create_list(:customer, 2)

    @customer = create(
      :customer,
      first_name: 'May',
      last_name: 'Be',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-28 14:53:59'
    )
  end

  it 'can find all records based on customer id query' do
    get "/api/v1/customers/find_all?id=#{@customer.id}"

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customers[:data]).to be_instance_of Array
    expect(customers[:data].size).to eq(1)
    expect(customers[:data].first[:id].to_i).to eq(@customer.id)
  end

  it 'can find all records based on customer first name query' do
    get "/api/v1/customers/find_all?first_name=#{@customer.first_name}"

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customers[:data]).to be_instance_of Array
    expect(customers[:data].size).to eq(1)
    expect(customers[:data].first[:id].to_i).to eq(@customer.id)
  end

  it 'can find all records based on customer last name query' do
    get "/api/v1/customers/find_all?last_name=#{@customer.last_name}"

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customers[:data]).to be_instance_of Array
    expect(customers[:data].size).to eq(1)
    expect(customers[:data].first[:id].to_i).to eq(@customer.id)
  end

  it 'can get all records based on customer created_at query' do
    get "/api/v1/customers/find_all?created_at=#{@customer.created_at}"

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customers[:data]).to be_instance_of Array
    expect(customers[:data].size).to eq(1)
    expect(customers[:data].first[:id].to_i).to eq(@customer.id)
  end

  it 'can get all records based on customer updated_at query' do
    get "/api/v1/customers/find_all?updated_at=#{@customer.updated_at}"

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customers[:data]).to be_instance_of Array
    expect(customers[:data].size).to eq(1)
    expect(customers[:data].first[:id].to_i).to eq(@customer.id)
  end
end
