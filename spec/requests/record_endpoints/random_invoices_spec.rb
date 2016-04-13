require "rails_helper"

RSpec.describe "Random Invoices Spec", :type => :request do
  include SpecHelpers

  it "finds a random invoice" do
    make_invoices

    get "/api/v1/invoices/random"
    expect(response.content_type).to eq("application/json")

    invoice = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("status")
  end
end
