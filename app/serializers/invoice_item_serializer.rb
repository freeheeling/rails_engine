class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :item_id, :invoice_id, :quantity
  attribute :unit_price { |inv_item| inv_item.unit_price.to_s }
end
