class Api::V1::Customers::MerchantsController < ApplicationController
  def show
    customer = Customer.find_by(id: params[:id])
    merchant = customer.favorite_merchant
    render json: MerchantSerializer.new(merchant)
  end
end
