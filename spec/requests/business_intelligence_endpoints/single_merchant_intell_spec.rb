
require "rails_helper"

RSpec.describe "Single Merchant Intell Spec", :type => :request do
  include SpecHelpers

  it "returns revenue for a merchant across all transactions" do
    make_transactions

    merchant = Merchant.first

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response.content_type).to eq("application/json")

    revenue = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(revenue).to eq({"revenue"=>"370.35"})
  end

  it "returns revenue for a merchants on a specific date" do
    make_transactions_intell

    merchant = Merchant.first

    get "/api/v1/merchants/#{merchant.id}/revenue?date=Wed, 13 Apr 2016 16:50:50 UTC +00:00"

    expect(response.content_type).to eq("application/json")

    revenue = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(revenue).to eq({"revenue"=>"370.35"})
  end

  it "returns favorite customer" do
    make_transactions

    merchant = Merchant.first

    customer = Customer.first

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response.content_type).to eq("application/json")

    customer_parsed = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(customer_parsed['id']).to eq(customer.id)
  end

  it "returns customers with pending invoices" do
    make_transactions_pending

    merchant = Merchant.first

    customer = Customer.first

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    expect(response.content_type).to eq("application/json")

    customers = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(customers.first['id']).to eq(customer.id)
  end
end
