require "rails_helper"

RSpec.describe "Random Invoices Spec", :type => :request do

  it "finds a random invoice" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    customer2 = Customer.create(first_name: "watney", last_name: "Jules")
    merchant2 = Merchant.create(name: "Nice Stuff")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    get "/api/v1/invoices/random"
    expect(response.content_type).to eq("application/json")

    invoice = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(invoice).to have_key("id")
  end
end
