require 'csv'

namespace :import do

  desc 'Imports customers from CSV file'
  task customers: :environment do
    file = 'db/data/customers.csv'

    CSV.foreach(file, headers: true) do |row|
      Customer.create!(row.to_hash)
    end
  end

  desc 'Imports invoice_items from CSV file'
  task invoice_items: :environment do
    file = 'db/data/invoice_items.csv'

    CSV.foreach(file, headers: true) do |row|
      row['unit_price'] = row['unit_price'].to_f/100
      InvoiceItem.create!(row.to_hash)
    end
  end

  desc 'Imports invoices from CSV file'
  task invoices: :environment do
    file = 'db/data/invoices.csv'

    CSV.foreach(file, headers: true) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  desc 'Imports items from CSV file'
  task items: :environment do
    file = 'db/data/items.csv'

    CSV.foreach(file, headers: true) do |row|
      row['unit_price'] = row['unit_price'].to_f/100
      Item.create!(row.to_hash)
    end
  end

  desc 'Imports merchants from CSV file'
  task merchants: :environment do
    file = 'db/data/merchants.csv'

    CSV.foreach(file, headers: true) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  desc 'Imports transactions from CSV file'
  task transactions: :environment do
    file = 'db/data/transactions.csv'

    CSV.foreach(file, headers: true) do |row|
      Transaction.create!(row.to_hash)
    end
  end
end
