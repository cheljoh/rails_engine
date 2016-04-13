require "rails_helper"

RSpec.describe "Items Spec", :type => :request do
  include SpecHelpers

  it "returns all items in the index" do
    make_items

    get "/api/v1/items.json"

    item_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_count).to eq(4)
  end

  it "returns a single item" do
    make_items

    item = Item.last

    get "/api/v1/items/#{item.id}.json"

    item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_parsed["name"]).to eq(item.name)
    expect(item_parsed["description"]).to eq(item.description)
  end

  it "finds a item by name case insensitive" do
    make_items

    item = Item.first

    get "/api/v1/items/find?name=#{item.name}"

    item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_parsed["name"]).to eq(item.name)
    expect(item_parsed["description"]).to eq(item.description)
  end

  it "finds all items given a description" do
    make_items

    item = Item.last

    get "/api/v1/items/find_all?name=#{item.name.upcase}"

    item_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(item_count).to eq(2)
  end
end
