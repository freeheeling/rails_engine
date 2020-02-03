class Api::V1::Transactions::RandomController < ApplicationController
  def show
    transaction = Transaction.all.sample
    render json: TransactionSerializer.new(transaction)
  end
end
