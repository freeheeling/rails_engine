class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.revenue_ranked(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end

  def show
    revenue = Merchant.revenue_on_date(params[:date])
    render json: MerchantRevenue.new(revenue).as_json
  end
end
