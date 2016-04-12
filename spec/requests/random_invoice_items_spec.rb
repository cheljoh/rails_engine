require "rails_helper"

RSpec.describe "Random Invoice Items Spec", :type => :request do

  it "finds a random customer" do
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
    get "/api/v1/invoice_items/random"
    expect(response.content_type).to eq("application/json")
  end
end
