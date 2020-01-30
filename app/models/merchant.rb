class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :name

  def self.revenue_ranked(quantity)
    joins(:invoice_items, :transactions).
      select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').
      group(:id).
      where(transactions: {result: 'success'}).
      order('revenue DESC').
      limit(quantity)
  end
end
