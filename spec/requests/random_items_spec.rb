require "rails_helper"

RSpec.describe "Random Items Spec", :type => :request do
  include SpecHelpers
  
  it "finds a random item" do
    make_items

    get "/api/v1/items/random"
    expect(response.content_type).to eq("application/json")

    item = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(item).to have_key("id")
  end
end
