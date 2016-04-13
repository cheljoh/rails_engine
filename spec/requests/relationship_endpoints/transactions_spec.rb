require "rails_helper"

RSpec.describe "Transactions Spec", :type => :request do
  include SpecHelpers

  it "returns associated invoice" do
    make_transactions

    invoice = Invoice.first
    transaction = Transaction.last

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response.content_type).to eq("application/json")

    transaction_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(transaction_parsed["id"]).to eq(invoice.id)
  end
end
