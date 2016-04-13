require "simplecov"
require "rspec/active_model/mocks"

module SpecHelpers

  def make_customers
    Customer.create(first_name: "Helga", last_name: "Johnson")
    Customer.create(first_name: "Lola", last_name: "Neato")
    Customer.create(first_name: "Alfred", last_name: "Nice")
    Customer.create(first_name: "Lola", last_name: "Nice")
  end

  def make_invoice_items
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    invoice2 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    item1 = Item.create(name: "tool", description: "really neat", unit_price: 123.45)
    InvoiceItem.create(item_id: item1.id, invoice_id: invoice2.id, unit_price: 123.45)

    customer2 = Customer.create(first_name: "Hello", last_name: "Watson")
    merchant2 = Merchant.create(name: "Neat stuff")
    item2 = Item.create(name: "sock", description: "nice", unit_price: 123.45)
    InvoiceItem.create(item_id: item2.id, invoice_id: invoice1.id, unit_price: 123.45)

    customer3 = Customer.create(first_name: "Steph", last_name: "Foo")
    merchant3 = Merchant.create(name: "Toys and Such")
    InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, unit_price: 123.43)

    customer4 = Customer.create(first_name: "Kally", last_name: "Wats")
    merchant4 = Merchant.create(name: "Fun Times")
    InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, unit_price: 125.32)
  end

  def make_invoices
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    customer2 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    merchant2 = Merchant.create(name: "Cool Things")
    Invoice.create(customer_id: customer1.id, merchant_id: merchant2.id, status: "shipped")
    Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    Invoice.create(customer_id: customer2.id, merchant_id: merchant1.id, status: "shipped")
  end

  def make_items
    merchant1 = Merchant.create(name: "Cool Things")
    merchant2 = Merchant.create(name: "Cool Things")
    Item.create(name: "tool", description: "really neat", unit_price: 123.45, merchant_id: merchant2.id)
    Item.create(name: "pants", description: "soft", unit_price: 123.42, merchant_id: merchant1.id)
    Item.create(name: "sock", description: "black", unit_price: 123.32, merchant_id: merchant1.id)
    Item.create(name: "sock", description: "red", unit_price: 123.32, merchant_id: merchant1.id)
  end

  def make_merchants
    merchant = Merchant.create(name: "Cool Things")
    merchant = Merchant.create(name: "Things")
    merchant = Merchant.create(name: "Fun Times")
    merchant = Merchant.create(name: "Fun Times")
  end

  def make_transactions
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped", created_at: "Wed, 13 Apr 2016 16:50:50 UTC +00:00")
    Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249631", result: "success")
    item = Item.create(name: "tool", description: "really neat", unit_price: 123.45, merchant_id: merchant1.id)
    InvoiceItem.create(item_id: item.id, invoice_id: invoice1.id, quantity: 1, unit_price: 123.45)

    customer2 = Customer.create(first_name: "Uh oh", last_name: "Julia")
    merchant2 = Merchant.create(name: "Cool Things")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", result: "success")

    Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249635", result: "success")

    Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249635", result: "success")
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  SimpleCov.start("rails")
end
