
require "rails_helper"

RSpec.describe "Single Merchant Intell Spec", :type => :request do
  include SpecHelpers

  it "returns revenue for a merchants across all transactions" do
    pending
    make_transactions

    merchant = Merchant.first #has three transactions

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response.content_type).to eq("application/json")

    items = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    # expect(items.count).to eq(3)
    # expect(items.last["id"]).to eq(item.id)
  end
end


# GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions
# GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
# GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
# GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices
