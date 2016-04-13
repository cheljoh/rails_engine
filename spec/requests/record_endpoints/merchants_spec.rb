require "rails_helper"

RSpec.describe "Merchants Spec", :type => :request do
  include SpecHelpers

  it "returns all merchants in the index" do
    make_merchants

    get "/api/v1/merchants.json"

    expect(response.content_type).to eq("application/json")

    merchant_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchant_count). to eq(4)
  end

  it "returns a single merchant" do
    make_merchants
    merchant = Merchant.last

    get "/api/v1/merchants/#{merchant.id}.json"

    merchant_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchant_parsed["name"]).to eq(merchant.name)
    expect(merchant_parsed["id"]).to eq(merchant.id)
  end

  it "can find a merchant by name case insensitive" do
    merchant = Merchant.create(name: "Cool Things")

    get "/api/v1/merchants/find?name=#{merchant.name.upcase}"

    merchant_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchant_parsed["name"]).to eq(merchant.name)
    expect(merchant_parsed["id"]).to eq(merchant.id)
  end

  it "can find all merchants" do
    make_merchants

    merchant = Merchant.last

    get "/api/v1/merchants/find_all?name=#{merchant.name}"

    merchant_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchant_count).to eq(2)
  end
end
