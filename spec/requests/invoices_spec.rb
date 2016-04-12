require "rails_helper"

RSpec.describe "Invoices Spec", :type => :request do

  it "returns all invoices in the index" do
    get "/api/v1/invoices.json"
    expect(response.content_type).to eq("application/json")
  end

  it "returns a single invoice" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    get "/api/v1/invoices/#{invoice.id}.json"
    expect(response.content_type).to eq("application/json")
  end
end
