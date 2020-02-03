require 'rails_helper'

RSpec.describe 'Transactions API find all endpoints' do
  before :each do
    create_list(:transaction, 2)

    @transaction = create(
      :transaction,
      credit_card_number: '242424242424242',
      result: 'unknown',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-28 14:53:59'
    )
  end

  it 'can find all records based on transaction id query' do
    get "/api/v1/transactions/find_all?id=#{@transaction.id}"

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data]).to be_instance_of Array
    expect(transactions[:data].size).to eq(1)
    expect(transactions[:data].first[:id].to_i).to eq(@transaction.id)
  end

  it 'can find all records based on transaction credit_card_number query' do
    transaction = create(:transaction, credit_card_number: '242424242424242')

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction.credit_card_number}"

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data]).to be_instance_of Array
    expect(transactions[:data].size).to eq(2)
    expect(transactions[:data].first[:id].to_i).to eq(@transaction.id)
    expect(transactions[:data].last[:id].to_i).to eq(transaction.id)
  end

  it 'can find all records based on transaction result query' do
    transaction = create(:transaction, result: 'unknown')

    get "/api/v1/transactions/find_all?result=#{transaction.result}"

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data]).to be_instance_of Array
    expect(transactions[:data].size).to eq(2)
    expect(transactions[:data].first[:id].to_i).to eq(@transaction.id)
    expect(transactions[:data].last[:id].to_i).to eq(transaction.id)
  end

  it 'can find all records based on transaction created_at query' do
    transaction = create(:transaction, created_at: '2012-03-27 14:53:59')

    get "/api/v1/transactions/find_all?created_at=#{transaction.created_at}"

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data]).to be_instance_of Array
    expect(transactions[:data].size).to eq(2)
    expect(transactions[:data].first[:id].to_i).to eq(@transaction.id)
    expect(transactions[:data].last[:id].to_i).to eq(transaction.id)
  end

  it 'can find all records based on transaction updated_at query' do
    transaction = create(:transaction, updated_at: '2012-03-28 14:53:59')

    get "/api/v1/transactions/find_all?updated_at=#{transaction.updated_at}"

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data]).to be_instance_of Array
    expect(transactions[:data].size).to eq(2)
    expect(transactions[:data].first[:id].to_i).to eq(@transaction.id)
    expect(transactions[:data].last[:id].to_i).to eq(transaction.id)
  end
end
