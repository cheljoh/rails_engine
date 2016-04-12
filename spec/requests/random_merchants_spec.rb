require "rails_helper"

RSpec.describe "Random Merchants Spec", :type => :request do

  it "finds a random merchant" do
    merchant = Merchant.create(name: "Cool Things")
    merchant = Merchant.create(name: "Cool Things")
    get "/api/v1/merchants/random"
    expect(response.content_type).to eq("application/json")
  end
end
