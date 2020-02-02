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
    before :each do
      item_1 = create(:item)
      @item_2 = create(:item)
      @item_3 = create(:item)
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice)
      invoice_3 = create(:invoice)
      create(:invoice_item, quantity: '1', unit_price: '3.00', item: item_1, invoice: invoice_1)
      create(:invoice_item, quantity: '2', unit_price: '2.00', item: @item_2, invoice: invoice_2)
      create(:invoice_item, quantity: '1', unit_price: '1.50', item: @item_3, invoice: invoice_3)
      create(:transaction, result: 'failed', invoice: invoice_1)
      create(:transaction, invoice: invoice_2)
      create(:transaction, invoice: invoice_3)
    end

    it 'revenue_ranked' do
      expect(Item.revenue_ranked(2)).to eq([@item_2, @item_3])
    end
  end
end
