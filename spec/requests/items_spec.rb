require "rails_helper"

RSpec.describe "Items Spec", :type => :request do

  it "returns all items in the index" do
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    item = Item.create(name: "sock", description: "really neat", unit_price: 12342)

    get "/api/v1/items.json"

    item_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_count). to eq(2)
  end

  it "returns a single item" do
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)

    get "/api/v1/items/#{item.id}.json"

    item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_parsed["name"]).to eq(item.name)
    expect(item_parsed["description"]).to eq(item.description)
  end

  it "finds a item by name case insensitive" do
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)

    get "/api/v1/items/find?name=#{item.name}"

    item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_parsed["name"]).to eq(item.name)
    expect(item_parsed["description"]).to eq(item.description)
  end

  it "finds all items given a description" do
    item = Item.create(name: "tool", description: "really neat", unit_price: 12345)
    item = Item.create(name: "sock", description: "really neat", unit_price: 12342)

    get "/api/v1/items/find_all?description=#{item.description.upcase}"

    item_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_count).to eq(2)
  end
end
