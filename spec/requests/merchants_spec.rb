require "rails_helper"

RSpec.describe "Merchants Spec", :type => :request do

  it "returns all merchants in the index" do
    get "/api/v1/merchants.json"
    #expect(response).to render_template()
    expect(response.content_type).to eq("application/json")
  end
end
