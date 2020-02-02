class Customer < ApplicationRecord
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :first_name, :last_name

  def favorite_merchant
    merchants.joins(:transactions).
      select('merchants.*, count(invoices.merchant_id) AS sales').
      merge(Transaction.successful).
      group(:id).
      order('sales DESC').
      first
  end
end
