class Api::V1::Items::QueryController < ApplicationController
  def show
    item = Item.find_by(query_params)
    render json: ItemSerializer.new(item)
  end

  def index
    items = Item.where(query_params)
    render json: ItemSerializer.new(items.sort)
  end

  private
    def query_params
      params.permit(
        :id,
        :merchant_id,
        :name,
        :description,
        :unit_price,
        :created_at,
        :updated_at
      )
    end
end
