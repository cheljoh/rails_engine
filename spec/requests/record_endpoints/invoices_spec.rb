require "rails_helper"

RSpec.describe "Invoices Spec", :type => :request do
  include SpecHelpers

  it "returns all invoices in the index" do
    make_invoices

    get "/api/v1/invoices.json"
    invoices_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoices_count). to eq(4)
  end

  it "returns a single invoice" do
    make_invoices

    invoice = Invoice.last

    get "/api/v1/invoices/#{invoice.id}.json"

    invoice_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_parsed["status"]).to eq(invoice.status)
    expect(invoice_parsed["id"]).to eq(invoice.id)
  end

  it "finds an invoice given a status" do
    make_invoices

    invoice = Invoice.first

    get "/api/v1/invoices/find?status=#{invoice.status.upcase}"

    invoice_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success

    expect(invoice_parsed["customer_id"]).to eq(invoice.customer_id)
    expect(invoice_parsed["id"]).to eq(invoice.id)
  end

  it "finds all invoices" do
    make_invoices

    invoice = Invoice.last

    get "/api/v1/invoices/find_all?status=#{invoice.status.upcase}"

    invoice_count = JSON.parse(response.body).count

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(invoice_count).to eq(4)
  end
end
