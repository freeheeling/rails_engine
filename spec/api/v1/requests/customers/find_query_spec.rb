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
end
