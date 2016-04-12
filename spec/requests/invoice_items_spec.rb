require "rails_helper"

RSpec.describe "Invoice Items Spec", :type => :request do

  it "returns all invoice items in the index" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    item1 = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    invoice_item1 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, unit_price: 12345)
    customer2 = Customer.create(first_name: "Hello", last_name: "Watson")
    merchant2 = Merchant.create(name: "Neat stuff")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    item2 = Item.create(name: "sock", description: "nice", unit_price: 12345)
    invoice_item2 = InvoiceItem.create(item_id: item2.id, invoice_id: invoice2.id, unit_price: 12345)

    get "/api/v1/invoice_items.json"

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    invoice_item_count = JSON.parse(response.body).count
    expect(invoice_item_count). to eq(2)
  end

  it "returns a single invoice item" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, unit_price: 12345)

    get "/api/v1/invoice_items/#{invoice_item.id}.json"

    invoice_item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_item_parsed["unit_price"]).to eq("12345.0")
    expect(invoice_item_parsed["id"]).to eq(invoice_item.id)
  end

  it "returns an invoice item through find" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    invoice_item = InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, unit_price: 12345)

    get "/api/v1/invoice_items/find?customer=#{customer.id}"

    invoice_item_parsed = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(invoice_item_parsed["unit_price"]).to eq("12345.0")
    expect(invoice_item_parsed["id"]).to eq(invoice_item.id)
  end

  it "finds all invoices" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    item1 = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    invoice_item1 = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, unit_price: 12345)
    customer2 = Customer.create(first_name: "Hello", last_name: "Watson")
    merchant2 = Merchant.create(name: "Neat stuff")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    item2 = Item.create(name: "sock", description: "nice", unit_price: 12345)
    invoice_item2 = InvoiceItem.create(item_id: item2.id, invoice_id: invoice2.id, unit_price: 12345)

    get "/api/v1/invoice_items/find_all?unit_price=#{invoice_item2.unit_price}"

    invoice_item_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_item_count).to eq(2)
  end
end
