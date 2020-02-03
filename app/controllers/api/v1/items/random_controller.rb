class Api::V1::Items::RandomController < ApplicationController
  def show
    item = Item.all.sample
    render json: ItemSerializer.new(item)
  end
end
