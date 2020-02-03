require 'rails_helper'

RSpec.describe 'Transactions API find endpoints' do
  before :each do
    @transaction = create(:transaction)
  end

  it 'can find a record based on transaction id query' do
    get "/api/v1/transactions/find?id=#{@transaction.id}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'can find a record based on transaction invoice_id query' do
    get "/api/v1/transactions/find?invoice_id=#{@transaction.invoice_id}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'can find a record based on transaction credit_card_number query' do
    get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'can find a record based on transaction result query' do
    get "/api/v1/transactions/find?result=#{@transaction.result}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'can find a record based on transaction created_at query' do
    get "/api/v1/transactions/find?created_at=#{@transaction.created_at}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'can find a record based on transaction updated_at query' do
    get "/api/v1/transactions/find?updated_at=#{@transaction.updated_at}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end
end
