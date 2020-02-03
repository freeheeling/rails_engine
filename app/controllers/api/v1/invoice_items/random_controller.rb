class Api::V1::InvoiceItems::RandomController < ApplicationController
  def show
    invoice_item = InvoiceItem.all.sample
    render json: InvoiceItemSerializer.new(invoice_item)
  end
end
