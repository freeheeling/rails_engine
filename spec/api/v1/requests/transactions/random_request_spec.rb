require 'rails_helper'

RSpec.describe 'Transactions API random endpoint' do
  it 'can get a random transaction' do
    create_list(:transaction, 3)

    get '/api/v1/transactions/random'

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction).to be_instance_of Hash
    expect(transaction[:data][:type]).to eq('transaction')
  end
end
