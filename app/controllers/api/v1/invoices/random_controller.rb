class Api::V1::Invoices::RandomController < ApplicationController
  def show
    invoice = Invoice.all.sample
    render json: InvoiceSerializer.new(invoice)
  end
end
