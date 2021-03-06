require "rails_helper"

RSpec.describe "Invoice Items Spec", :type => :request do
  include SpecHelpers

  it "returns all invoice items in the index" do
    make_invoice_items

    get "/api/v1/invoice_items.json"

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    invoice_item_count = JSON.parse(response.body).count
    expect(invoice_item_count).to eq(4)
  end

  it "returns a single invoice item" do
    make_invoice_items
    invoice_item = InvoiceItem.last

    get "/api/v1/invoice_items/#{invoice_item.id}.json"

    invoice_item_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_item_parsed["unit_price"]).to eq("125.32")
    expect(invoice_item_parsed["id"]).to eq(invoice_item.id)
  end

  it "returns an invoice item through find" do
    make_invoice_items
    invoice_item = InvoiceItem.last
    customer = Customer.last

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

    invoice_item_parsed = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(invoice_item_parsed["unit_price"]).to eq("125.32")
    expect(invoice_item_parsed["id"]).to eq(invoice_item.id)
  end

  it "finds all invoices given a parameter" do
    make_invoice_items

    invoice_item = InvoiceItem.first

    get "/api/v1/invoice_items/find_all?unit_price=#{invoice_item.unit_price}"

    invoice_item_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_item_count).to eq(2)
  end
end
