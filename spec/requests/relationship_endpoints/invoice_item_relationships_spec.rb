require "rails_helper"

RSpec.describe "Invoice Item Relationships Spec", :type => :request do
  include SpecHelpers

  it "returns the associated invoice" do
    make_invoice_items

    invoice_item = InvoiceItem.last
    invoice = Invoice.first

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response.content_type).to eq("application/json")

    invoice_item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_item_parsed["id"]).to eq(invoice.id)
  end

  it "returns the associated item" do
    make_invoice_items

    invoice_item = InvoiceItem.last
    item = Item.first

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response.content_type).to eq("application/json")

    invoice_item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_item_parsed["id"]).to eq(item.id)
  end
end
