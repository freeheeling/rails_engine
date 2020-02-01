class Api::V1::Customers::QueryController < ApplicationController
  def show
    customer = Customer.find_by(query_params)
    render json: CustomerSerializer.new(customer)
  end

  private
    def query_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
