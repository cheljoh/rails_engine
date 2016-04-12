require "rails_helper"

RSpec.describe "Transactions Spec", :type => :request do

  it "returns all transactions in the index" do
    get "/api/v1/transactions.json"
    expect(response.content_type).to eq("application/json")
  end
end
