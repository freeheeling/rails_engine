class Api::V1::Merchants::CustomersController < ApplicationController
  def show
    merchant = Merchant.find_by(id: params[:id])
    customer = merchant.favorite_customer
    render json: CustomerSerializer.new(customer)
  end
end
