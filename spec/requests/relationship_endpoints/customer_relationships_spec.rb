require "rails_helper"

RSpec.describe "Customer Relationships Spec", :type => :request do
  include SpecHelpers

  it "returns all associated invoices" do
    make_invoices

    customer = Customer.first
    invoice = Invoice.first

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response.content_type).to eq("application/json")

    invoices = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.first["id"]).to eq(invoice.id)
  end

  it "returns all associated transactions" do
    make_transactions

    transaction = Transaction.first

    customer = Customer.first

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response.content_type).to eq("application/json")

    transactions = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transactions.first["id"]).to eq(transaction.id)
  end
end
