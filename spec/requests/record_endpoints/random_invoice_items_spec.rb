require "rails_helper"

RSpec.describe "Random Invoice Items Spec", :type => :request do
  include SpecHelpers

  it "finds a random invoice item" do
    make_invoice_items
    get "/api/v1/invoice_items/random"
    expect(response.content_type).to eq("application/json")

    invoice_item = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")

    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end
end
