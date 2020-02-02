class Api::V1::Items::RevenueController < ApplicationController
  def index
    items = Item.revenue_ranked(params[:quantity])
    render json: ItemSerializer.new(items)
  end
end
