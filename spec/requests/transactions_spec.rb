require "rails_helper"

RSpec.describe "Transactions Spec", :type => :request do

  it "returns all transactions in the index" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", result: "success")
    customer2 = Customer.create(first_name: "Uh oh", last_name: "Julia")
    merchant2 = Merchant.create(name: "Cool Things")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", result: "success")

    get "/api/v1/transactions.json"

    expect(response.content_type).to eq("application/json")

    transactions_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transactions_count). to eq(2)
  end

  it "returns a single transaction" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: "4654405418249632", result: "success")

    get "/api/v1/transactions/#{transaction.id}.json"

    expect(response.content_type).to eq("application/json")

    transaction_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transaction_parsed["invoice_id"]).to eq(transaction.invoice_id)
    expect(transaction_parsed["result"]).to eq(transaction.result)
  end

  it "returns a single transaction through find" do
    customer = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant = Merchant.create(name: "Cool Things")
    invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
    transaction = Transaction.create(invoice_id: invoice.id, credit_card_number: "4654405418249632", result: "success")

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    transaction_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transaction_parsed["invoice_id"]).to eq(invoice.id)
    expect(transaction_parsed["result"]).to eq(transaction.result)
  end

  it "it finds all transactions by parameters" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", result: "success")
    customer2 = Customer.create(first_name: "Uh oh", last_name: "Julia")
    merchant2 = Merchant.create(name: "Cool Things")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", result: "success")

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction2.credit_card_number}"

    transaction_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transaction_count).to eq(2)
  end
end
