require "rails_helper"

RSpec.describe "Transactions Spec", :type => :request do
  include SpecHelpers

  it "returns all transactions in the index" do
    make_transactions

    get "/api/v1/transactions.json"

    expect(response.content_type).to eq("application/json")

    transactions_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transactions_count). to eq(4)
  end

  it "returns a single transaction" do
    make_transactions

    transaction = Transaction.last

    get "/api/v1/transactions/#{transaction.id}.json"

    expect(response.content_type).to eq("application/json")

    transaction_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transaction_parsed["invoice_id"]).to eq(transaction.invoice_id)
    expect(transaction_parsed["result"]).to eq(transaction.result)
  end

  it "returns a single transaction through find" do
    make_transactions

    transaction = Transaction.last

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    transaction_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transaction_parsed["invoice_id"]).to eq(transaction.invoice_id)
    expect(transaction_parsed["result"]).to eq(transaction.result)
  end

  it "it finds all transactions by parameters" do
    make_transactions

    transaction = Transaction.last

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction.credit_card_number}"

    transaction_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transaction_count).to eq(2)
  end
end
