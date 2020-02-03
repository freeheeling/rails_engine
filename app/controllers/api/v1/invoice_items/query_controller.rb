class Api::V1::InvoiceItems::QueryController < ApplicationController
  def show
    invoice_item = InvoiceItem.find_by(query_params)
    render json: InvoiceItemSerializer.new(invoice_item)
  end

  def index
    invoice_items = InvoiceItem.where(query_params)
    render json: InvoiceItemSerializer.new(invoice_items.sort)
  end

  private
    def query_params
      params.permit(
        :id,
        :item_id,
        :invoice_id,
        :quantity,
        :unit_price,
        :created_at,
        :updated_at
      )
    end
end
