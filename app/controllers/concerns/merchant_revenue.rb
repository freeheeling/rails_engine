class MerchantRevenue
  def initialize(revenue)
    @revenue = revenue
  end

  def as_json
    { data: { attributes: { total_revenue: revenue.to_s } } }
  end

  private
    attr_reader :revenue
end
