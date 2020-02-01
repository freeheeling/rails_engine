require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many :invoices }
    it { should have_many :items }
    it { should have_many(:invoice_items).through(:invoices) }
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'class methods' do
    before :each do
      create(:customer)
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant)
      @merchant_3 = create(:merchant)
      @invoice_1 = create(:invoice, merchant: @merchant_1)
      invoice_2 = create(:invoice, merchant: @merchant_2)
      invoice_3 = create(:invoice, merchant: @merchant_3)
      create(:invoice_item, quantity: '3', unit_price: '1.00', invoice: @invoice_1)
      create(:invoice_item, quantity: '2', unit_price: '2.00', invoice: invoice_2)
      create(:invoice_item, quantity: '1', unit_price: '2.55', invoice: invoice_3)
      create(:transaction, invoice: @invoice_1)
      create(:transaction, invoice: invoice_2)
      create(:transaction, invoice: invoice_3)
    end

    it 'revenue_ranked' do
      expect(Merchant.revenue_ranked(3)).to eq([@merchant_2, @merchant_1, @merchant_3])
    end

    it 'revenue_on_date' do
      expect(Merchant.revenue_on_date(@invoice_1.created_at).to_s).to eq('9.55')
    end
  end

  describe 'instance methods' do
    it 'favorite customer' do
      merchant = create(:merchant)
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      customer_3 = create(:customer)
      invoice_1 = create(:invoice, merchant: merchant, customer: customer_1)
      invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)
      invoice_3 = create(:invoice, merchant: merchant, customer: customer_2)
      invoice_4 = create(:invoice, merchant: merchant, customer: customer_3)
      invoice_5 = create(:invoice, merchant: merchant, customer: customer_3)
      invoice_6 = create(:invoice, merchant: merchant, customer: customer_3)
      create(:transaction, invoice: invoice_1)
      create(:transaction, invoice: invoice_2)
      create(:transaction, invoice: invoice_3)
      create(:transaction, invoice: invoice_4)
      create(:transaction, result: 'failed', invoice: invoice_5)
      create(:transaction, result: 'failed', invoice: invoice_6)

      expect(merchant.favorite_customer).to eq(customer_2)
    end
  end
end
