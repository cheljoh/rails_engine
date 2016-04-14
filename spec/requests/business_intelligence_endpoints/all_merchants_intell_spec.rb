
require "rails_helper"

RSpec.describe "All Merchants Intell Spec", :type => :request do
  include SpecHelpers 

  it "returns top merchants ranked by total revenue" do
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response.content_type).to eq("application/json")

    merchants = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchants.first['id']).to eq(merchant.id)
  end

  it "returns top merchants ranked by total items sold" do
    pending
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/most_items?quantity=2"

    expect(response.content_type).to eq("application/json")

    merchants = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchants.first).to eq(merchant)
  end
end





# GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue
# GET /api/v1/merchants/most_items?quantity=x returns the top x merchants ranked by total number of items sold
# GET /api/v1/merchants/revenue?date=x returns the total revenue for date x across all merchants
