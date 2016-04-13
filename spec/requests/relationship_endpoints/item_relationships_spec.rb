require "rails_helper"

RSpec.describe "Item Relationships Spec", :type => :request do
  include SpecHelpers

  it "returns all associated invoice items" do
    make_invoice_items

    item = Item.first
    invoice_item = InvoiceItem.last

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response.content_type).to eq("application/json")

    invoice_items = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.last["id"]).to eq(invoice_item.id)
  end

  it "returns the associated merchant" do
    make_items

    merchant = Merchant.first

    item = Item.last

    get "/api/v1/items/#{item.id}/merchant"

    expect(response.content_type).to eq("application/json")

    merchant_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(merchant_parsed["id"]).to eq(merchant.id)
  end
end
