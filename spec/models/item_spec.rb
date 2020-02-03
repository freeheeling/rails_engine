require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }

    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should have_many(:transactions).through(:invoices) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
  end

  describe 'class methods' do
    it 'revenue_ranked' do
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice)
      invoice_3 = create(:invoice)
      create(:invoice_item, quantity: '1', unit_price: '3.00', item: item_1, invoice: invoice_1)
      create(:invoice_item, quantity: '2', unit_price: '2.00', item: item_2, invoice: invoice_2)
      create(:invoice_item, quantity: '1', unit_price: '1.50', item: item_3, invoice: invoice_3)
      create(:transaction, result: 'failed', invoice: invoice_1)
      create(:transaction, invoice: invoice_2)
      create(:transaction, invoice: invoice_3)

      expect(Item.revenue_ranked(2)).to eq([item_2, item_3])
    end
  end

  describe 'instance methods' do
    xit 'best_day' do
      item = create(:item)
      invoice_1 = create(:invoice, created_at: '2014-03-27')
      invoice_2 = create(:invoice, created_at: '2014-03-27')
      invoice_3 = create(:invoice, created_at: '2014-04-27')
      invoice_4 = create(:invoice, created_at: '2014-04-27')
      invoice_5 = create(:invoice, created_at: '2014-05-27')
      create(:invoice_item, item: item, invoice: invoice_1)
      create(:invoice_item, item: item, invoice: invoice_2)
      create(:invoice_item, item: item, invoice: invoice_3)
      create(:invoice_item, item: item, invoice: invoice_4)
      create(:invoice_item, item: item, invoice: invoice_5)
      create(:transaction, invoice: invoice_1)
      create(:transaction, result: 'failed', invoice: invoice_2)
      create(:transaction, invoice: invoice_3)
      create(:transaction, result: 'failed', invoice: invoice_4)
      create(:transaction, invoice: invoice_5)

      expect(item.best_day(item.id)).to eq(invoice_5.created_at)
    end
  end
end
