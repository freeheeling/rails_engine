class Api::V1::Merchants::RandomController < ApplicationController
  def show
    merchant = Merchant.all.sample
    render json: MerchantSerializer.new(merchant)
  end
end
