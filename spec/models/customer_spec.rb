require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :invoices }
    it { should have_many(:invoice_items).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe 'instance methods' do
    it 'favorite merchant' do
      customer = create(:customer)
      merchant_1 = create(:merchant)
      merchant_1 = create(:merchant)
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      merchant_2 = create(:merchant)
      invoice_1 = create(:invoice, customer: customer, merchant: merchant_1)
      invoice_2 = create(:invoice, customer: customer, merchant: merchant_1)
      invoice_3 = create(:invoice, customer: customer, merchant: merchant_1)
      invoice_4 = create(:invoice, customer: customer, merchant: merchant_2)
      invoice_5 = create(:invoice, customer: customer, merchant: merchant_2)
      create(:transaction, invoice: invoice_1)
      create(:transaction, result: 'failed', invoice: invoice_2)
      create(:transaction, result: 'failed', invoice: invoice_3)
      create(:transaction, invoice: invoice_4)
      create(:transaction, invoice: invoice_5)

      expect(customer.favorite_merchant).to eq(merchant_2)
    end
  end
end
