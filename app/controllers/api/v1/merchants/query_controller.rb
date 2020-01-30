class Api::V1::Merchants::QueryController < ApplicationController
  def show
    merchant = Merchant.find_by(query_params)
    render json: MerchantSerializer.new(merchant)
  end

  def index
    merchants = Merchant.where(query_params)
    render json: MerchantSerializer.new(merchants)
  end

  private
    def query_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
