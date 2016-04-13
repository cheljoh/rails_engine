require "rails_helper"

RSpec.describe "Invoice Relationships Spec", :type => :request do
  include SpecHelpers

  it "returns all associated transactions" do
    make_transactions

    invoice = Invoice.first

    transaction = Transaction.last

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response.content_type).to eq("application/json")

    transactions = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transactions.last["id"]).to eq(transaction.id)
  end

  it "returns all associated invoice items" do
    make_invoice_items

    invoice = Invoice.first
    invoice_item = InvoiceItem.last

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response.content_type).to eq("application/json")

    transactions = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transactions.last["id"]).to eq(invoice_item.id)
  end

  it "returns all associated items" do
    make_invoice_items

    invoice = Invoice.first
    item = Item.last

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response.content_type).to eq("application/json")

    items = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(items.last["id"]).to eq(item.id)
  end

  it "returns associated customer" do
    make_invoices

    invoice = Invoice.last
    customer = Customer.last

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response.content_type).to eq("application/json")

    customer_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(customer_parsed["id"]).to eq(customer.id)
  end

  it "returns associated merchant" do
    make_invoices

    invoice = Invoice.last
    merchant = Merchant.first

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response.content_type).to eq("application/json")

    merchant_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchant_parsed["id"]).to eq(merchant.id)
  end
end
