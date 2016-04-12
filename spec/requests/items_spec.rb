require "rails_helper"

RSpec.describe "Items Spec", :type => :request do

  it "returns all items in the index" do
    get "/api/v1/items.json"
    expect(response.content_type).to eq("application/json")
  end
end
