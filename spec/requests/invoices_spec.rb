require "rails_helper"

RSpec.describe "Invoices Spec", :type => :request do

  it "returns all invoices in the index" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    customer2 = Customer.create(first_name: "watney", last_name: "Jules")
    merchant2 = Merchant.create(name: "Nice Stuff")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")

    get "/api/v1/invoices.json"
    invoices_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoices_count). to eq(2)
  end

  it "returns a single invoice" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices/#{invoice.id}.json"

    invoice_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_parsed["status"]).to eq(invoice.status)
    expect(invoice_parsed["id"]).to eq(invoice.id)
  end

  it "finds an invoice given a status" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

    get "/api/v1/invoices/find?status=#{invoice.status.upcase}"

    invoice_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success

    expect(invoice_parsed["customer_id"]).to eq(invoice.customer_id)
    expect(invoice_parsed["id"]).to eq(invoice.id)

  end

  it "finds all invoices" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    customer2 = Customer.create(first_name: "watney", last_name: "Jules")
    merchant2 = Merchant.create(name: "Nice Stuff")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")

    get "/api/v1/invoices/find_all?status=#{invoice2.status.upcase}"

    invoice_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_count).to eq(2)
  end
end
