class Api::V1::Transactions::QueryController < ApplicationController
  def show
    transaction = Transaction.find_by(query_params)
    render json: TransactionSerializer.new(transaction)
  end

  private
    def query_params
      params.permit(
        :id,
        :invoice_id,
        :credit_card_number,
        :result,
        :created_at,
        :updated_at)
    end
end
