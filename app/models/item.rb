class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  validates_presence_of :name, :description, :unit_price

  def self.revenue_ranked(quantity)
    joins(:invoice_items, :transactions).
      select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').
      merge(Transaction.successful).
      group(:id).
      order('revenue DESC').
      limit(quantity)
  end

  def best_day(item_id)
    Invoice.joins(:items, :transactions).
      select("invoices.*, date_trunc('day', invoices.created_at) AS date, sum(invoice_items.quantity) AS sales").
      where("items.id = ?", "#{item_id}").
      merge(Transaction.successful).
      group(:id).
      group('date').
      order('sales desc').
      order('date desc').
      first
  end
end
