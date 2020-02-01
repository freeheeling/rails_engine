require 'rails_helper'

RSpec.describe 'Customers API find endpoints' do
  before :each do
    @customer = create(:customer)
  end

  it 'can find a record based on customer id query' do
    get "/api/v1/customers/find?id=#{@customer.id}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end

  it 'can find a record based on customer first name query' do
    get "/api/v1/customers/find?first_name=#{@customer.first_name}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end

  it 'can find a record based on customer last name query' do
    get "/api/v1/customers/find?last_name=#{@customer.last_name}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end

  it 'can find a record based on customer created_at query' do
    get "/api/v1/customers/find?created_at=#{@customer.created_at}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end

  it 'can find a record based on customer updated_at query' do
    get "/api/v1/customers/find?=updated_at#{@customer.updated_at}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end
end
