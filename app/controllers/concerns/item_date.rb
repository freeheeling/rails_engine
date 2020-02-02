class ItemDate
  def initialize(date)
    @date = date
  end

  def as_json
    { data: { attributes: { best_day: date.to_s } } }
  end

  private
    attr_reader :date
end
