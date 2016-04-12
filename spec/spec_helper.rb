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
    item1 = Item.create(name: "tool", description: "really neat", unit_price: 123.45)
    InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, unit_price: 123.45)

    customer2 = Customer.create(first_name: "Hello", last_name: "Watson")
    merchant2 = Merchant.create(name: "Neat stuff")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    item2 = Item.create(name: "sock", description: "nice", unit_price: 123.45)
    InvoiceItem.create(item_id: item2.id, invoice_id: invoice2.id, unit_price: 123.45)

    customer3 = Customer.create(first_name: "Steph", last_name: "Foo")
    merchant3 = Merchant.create(name: "Toys and Such")
    invoice3 = Invoice.create(customer_id: customer3.id, merchant_id: merchant3.id, status: "shipped")
    item3 = Item.create(name: "yoyo", description: "blue", unit_price: 123.43)
    InvoiceItem.create(item_id: item3.id, invoice_id: invoice3.id, unit_price: 123.43)

    customer4 = Customer.create(first_name: "Kally", last_name: "Wats")
    merchant4 = Merchant.create(name: "Fun Times")
    invoice4 = Invoice.create(customer_id: customer4.id, merchant_id: merchant4.id, status: "shipped")
    item4 = Item.create(name: "sock", description: "nice", unit_price: 125.32)
    InvoiceItem.create(item_id: item4.id, invoice_id: invoice4.id, unit_price: 125.32)
  end

  def make_invoices
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")

    customer2 = Customer.create(first_name: "watney", last_name: "Jules")
    merchant2 = Merchant.create(name: "Nice Stuff")
    Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")

    customer3 = Customer.create(first_name: "Whit", last_name: "Jameson")
    merchant3 = Merchant.create(name: "Fun Times")
    Invoice.create(customer_id: customer3.id, merchant_id: merchant3.id, status: "shipped")

    customer4 = Customer.create(first_name: "Whit", last_name: "Jameson")
    merchant4 = Merchant.create(name: "Coolios")
    Invoice.create(customer_id: customer4.id, merchant_id: merchant4.id, status: "shipped")
  end

  def make_items
    Item.create(name: "tool", description: "really neat", unit_price: 123.45)
    Item.create(name: "pants", description: "soft", unit_price: 123.42)
    Item.create(name: "sock", description: "black", unit_price: 123.32)
    Item.create(name: "sock", description: "red", unit_price: 123.32)
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
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", result: "success")

    customer2 = Customer.create(first_name: "Uh oh", last_name: "Julia")
    merchant2 = Merchant.create(name: "Cool Things")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249631", result: "success")

    customer3 = Customer.create(first_name: "Yikes", last_name: "Johnson")
    merchant3 = Merchant.create(name: "Cool Things")
    invoice3 = Invoice.create(customer_id: customer3.id, merchant_id: merchant3.id, status: "shipped")
    Transaction.create(invoice_id: invoice3.id, credit_card_number: "4654405418249635", result: "success")

    customer4 = Customer.create(first_name: "Susan", last_name: "Jules")
    merchant4 = Merchant.create(name: "Cool Things")
    invoice4 = Invoice.create(customer_id: customer4.id, merchant_id: merchant4.id, status: "shipped")
    Transaction.create(invoice_id: invoice4.id, credit_card_number: "4654405418249635", result: "success")
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
