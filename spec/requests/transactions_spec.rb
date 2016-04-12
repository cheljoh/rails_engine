require "rails_helper"

RSpec.describe "Transactions Spec", :type => :request do

  it "returns all transactions in the index" do
    get "/api/v1/transactions.json"
    expect(response.content_type).to eq("application/json")
  end

  it "returns a single transaction" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: "4654405418249632", result: "success")
    get "/api/v1/transactions/#{transaction.id}.json"
    expect(response.content_type).to eq("application/json")
  end

  it "returns a single transaction through find" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: "4654405418249632", result: "success")
    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"
    expect(response.content_type).to eq("application/json")
  end
end
