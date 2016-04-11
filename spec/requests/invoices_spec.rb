require "rails_helper"

RSpec.describe "Invoice Spec", :type => :request do

  it "returns all invoices in the index" do
    get "/api/v1/invoices.json"
    #expect(response).to render_template()
    expect(response.content_type).to eq("application/json")
  end
end
