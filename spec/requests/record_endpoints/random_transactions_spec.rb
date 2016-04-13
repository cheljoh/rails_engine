require "rails_helper"

RSpec.describe "Random Transactions Spec", :type => :request do
  include SpecHelpers

  it "finds a random transaction" do
    make_transactions

    get "/api/v1/transactions/random"
    expect(response.content_type).to eq("application/json")

    transaction = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("result")
  end
end
