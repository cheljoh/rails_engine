require "rails_helper"

RSpec.describe "Random Merchants Spec", :type => :request do
  include SpecHelpers

  it "finds a random merchant" do
    make_merchants

    get "/api/v1/merchants/random"
    expect(response.content_type).to eq("application/json")

    merchant = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(merchant).to have_key("id")
  end
end
