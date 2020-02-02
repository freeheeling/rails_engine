class Api::V1::Customers::RandomController < ApplicationController
  def show
    customer = Customer.all.sample
    render json: CustomerSerializer.new(customer)
  end
end
