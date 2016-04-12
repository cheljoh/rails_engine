require "rails_helper"

RSpec.describe "Invoice Items Spec", :type => :request do

  it "returns all invoice items in the index" do
    get "/api/v1/invoice_items.json"
    expect(response.content_type).to eq("application/json")
  end
end
