require 'csv' #could also be in application.rb

namespace :import do #prolly want to import all of them at once

  desc "Import merchants from csv"
  task merchants: :environment do #envt gives you access to users
    CSV.foreach("data/merchants.csv", headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  desc "Import invoices from csv"
  task invoices: :environment do
    CSV.foreach("data/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  desc "Import customers from csv"
  task customers: :environment do
    CSV.foreach("data/customers.csv", headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

  desc "Import items from csv"
  task items: :environment do
    CSV.foreach("data/items.csv", headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  desc "Import invoice items from csv"
  task invoice_items: :environment do
    CSV.foreach("data/invoice_items.csv", headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  desc "Import transactions from csv"
  task transactions: :environment do
    CSV.foreach("data/transactions.csv", headers: true) do |row|
      Transaction.create(
        id:                  row["id"],
        invoice_id:          row["invoice_id"],
        credit_card_number:  row["credit_card_number"],
        result:              row["result"],
        created_at:          row["created_at"],
        updated_at:          row["updated_at"])
    end
  end
end
