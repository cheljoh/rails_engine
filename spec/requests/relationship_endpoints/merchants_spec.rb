require "rails_helper"

RSpec.describe "Merchants Spec", :type => :request do
  include SpecHelpers

  it "returns all items associated with a merchant" do
    make_items

    merchant = Merchant.first

    item = Item.last

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response.content_type).to eq("application/json")

    items = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(items.last["id"]).to eq(item.id)
  end

  it "returns all invoices associated with a merchant" do
    make_invoices

    merchant = Merchant.first

    invoice = Invoice.last

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response.content_type).to eq("application/json")

    invoices = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoices.last["id"]).to eq(invoice.id)
  end
end
