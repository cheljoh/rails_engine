require "rails_helper"

RSpec.describe "Random Items Spec", :type => :request do

  it "finds a random item" do
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    item = Item.create(name: "sock", description: "really neat", unit_price: 12765)
    get "/api/v1/items/random"
    expect(response.content_type).to eq("application/json")

    item = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(item).to have_key("id")
  end
end
