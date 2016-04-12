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

  it "finds an invoice given a status" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    get "/api/v1/invoices/find?status=#{invoice.status.upcase}"
    expect(response.content_type).to eq("application/json")
  end

  it "finds all invoices" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    customer2 = Customer.create(first_name: "watney", last_name: "Jules")
    merchant2 = Merchant.create(name: "Nice Stuff")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    get "/api/v1/invoices/find_all?status=#{invoice2.status.upcase}"
    expect(response.content_type).to eq("application/json")
  end
end
