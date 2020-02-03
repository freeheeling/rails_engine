require 'rails_helper'

RSpec.describe 'Transactions API index and show endpoints' do
  it 'can get a list of all transactions' do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data].size).to eq(3)
  end

  it 'can get a specific transaction by id' do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(id)
  end
end
