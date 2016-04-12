require "rails_helper"

RSpec.describe "Customers Spec", :type => :request do

  it "returns all customers in the index" do
    get "/api/v1/customers.json"
    expect(response.content_type).to eq("application/json")
  end
end
