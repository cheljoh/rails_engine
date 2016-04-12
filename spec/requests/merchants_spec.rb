require "rails_helper"

RSpec.describe "Merchants Spec", :type => :request do

  it "returns all merchants in the index" do
    get "/api/v1/merchants.json"
    expect(response.content_type).to eq("application/json")
  end

  it "returns a single merchant" do
    merchant = Merchant.create(name: "Cool Things")
    get "/api/v1/merchants/#{merchant.id}.json"
    expect(response.content_type).to eq("application/json")
  end

  it "can find a merchant" do
    merchant = Merchant.create(name: "Cool Things")
    get "/api/v1/merchants/find?id=#{merchant.id}"
    expect(response.content_type).to eq("application/json")
  end
end
