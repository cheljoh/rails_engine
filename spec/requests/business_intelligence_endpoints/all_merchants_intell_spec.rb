
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
    expect(merchants.count).to eq(2)
  end

  it "returns top merchants ranked by total items sold" do
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/most_items?quantity=2"

    expect(response.content_type).to eq("application/json")

    merchants = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchants.first['id']).to eq(merchant.id)
    expect(merchants.count).to eq(2)
  end

  it "returns total revenue for all merchants by date" do
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/revenue?date=Wed, 13 Apr 2016 16:50:50 UTC +00:00"

    expect(response.content_type).to eq("application/json")

    revenue = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(revenue).to eq({"total_revenue"=>"370.35"})
  end
end
