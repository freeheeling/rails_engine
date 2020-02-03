class Api::V1::Items::DatesController < ApplicationController
  def show
    item = Item.find_by(id: params[:id])
    date = item.best_day(item.id).created_at
    render json: ItemDate.new(date).as_json
  end
end
