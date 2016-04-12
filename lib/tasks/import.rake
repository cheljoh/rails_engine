require 'csv'

namespace :import do

  desc "Import data from csv"
  task data: :environment do
    CSV.foreach("data/merchants.csv", headers: true) do |row|
      Merchant.create(row.to_h)
    end

    CSV.foreach("data/customers.csv", headers: true) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach("data/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach("data/items.csv", headers: true) do |row|
      formatted_price = row["unit_price"].to_i/100.0
      Item.create(
        id:              row["id"],
        name:            row["name"],
        description:     row["description"],
        unit_price:      formatted_price,
        merchant_id:     row["merchant_id"],
        created_at:      row["created_at"],
        updated_at:      row["updated_at"])
    end

    CSV.foreach("data/invoice_items.csv", headers: true) do |row|
      formatted_price = row["unit_price"].to_i/100.0
      InvoiceItem.create(
        id:              row["id"],
        item_id:         row["item_id"],
        invoice_id:      row["invoice_id"],
        quantity:        row["quantity"],
        unit_price:      formatted_price,
        created_at:      row["created_at"],
        updated_at:      row["updated_at"])
    end

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
