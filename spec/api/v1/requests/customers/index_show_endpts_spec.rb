require 'rails_helper'

RSpec.describe 'Customers API index and show endpoints' do
  it 'can get a list of all customers' do
    create_list(:customer, 3)

    get '/api/v1/customers'

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customers[:data].size).to eq(3)
  end

  it 'can get a specific customer by id' do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(id)
  end
end
