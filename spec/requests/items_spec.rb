require "rails_helper"

RSpec.describe "Items Spec", :type => :request do

  it "returns all items in the index" do
    get "/api/v1/items.json"
    expect(response.content_type).to eq("application/json")
  end

  it "returns a single item" do
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    get "/api/v1/items/#{item.id}.json"
    expect(response.content_type).to eq("application/json")
  end

  it "finds a item by name case insensitive" do
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    get "/api/v1/customers/find?name=#{item.name.upcase}"
    expect(response.content_type).to eq("application/json")
  end
end
