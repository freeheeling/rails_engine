require 'rails_helper'

RSpec.describe 'Customers API random endpoint' do
  it 'can get a random customer' do
    create_list(:customer, 3)

    get '/api/v1/customers/random'

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer).to be_instance_of Hash
    expect(customer[:data][:type]).to eq('customer')
  end
end
