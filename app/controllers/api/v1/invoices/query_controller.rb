class Api::V1::Invoices::QueryController < ApplicationController
  def show
    invoice = Invoice.find_by(query_params)
    render json: InvoiceSerializer.new(invoice)
  end

  def index
    invoices = Invoice.where(query_params)
    render json: InvoiceSerializer.new(invoices.sort)
  end

  private
    def query_params
      params.permit(
        :id,
        :status,
        :created_at,
        :updated_at,
        :customer_id,
        :merchant_id)
    end
end
