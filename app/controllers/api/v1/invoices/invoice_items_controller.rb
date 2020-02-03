class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    invoice = Invoice.find_by(id: params[:id])
    render json: InvoiceItemSerializer.new(invoice.invoice_items)
  end
end
