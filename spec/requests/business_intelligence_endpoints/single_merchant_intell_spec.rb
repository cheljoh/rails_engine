
require "rails_helper"

RSpec.describe "Single Merchant Intell Spec", :type => :request do
  include SpecHelpers #need to have better spec helper for this

  it "returns revenue for a merchants across all transactions" do
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response.content_type).to eq("application/json")

    revenue = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(revenue).to eq({"revenue"=>"370.35"})
  end

  it "returns revenue for a merchants on a specific date" do
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/#{merchant.id}/revenue?date=Wed, 13 Apr 2016 16:50:50 UTC +00:00"

    expect(response.content_type).to eq("application/json")

    revenue = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(revenue).to eq({"revenue"=>"370.35"})
  end
  
  it "returns revenue for a merchants on a specific date" do
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/#{merchant.id}/revenue?date=Wed, 13 Apr 2016 16:50:50 UTC +00:00"

    expect(response.content_type).to eq("application/json")

    revenue = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(revenue).to eq({"revenue"=>"370.35"})
  end
end


# GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions
# GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x
# GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
# GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices
