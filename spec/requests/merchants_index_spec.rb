require "rails_helper"

RSpec.describe "Merchants Index Spec", :type => :request do

  it "returns all merchants in the index" do
    get "/api/v1/merchants.json"
    expect(response).to render_template(:index)
  end

end
