class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.revenue_ranked(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end
end
