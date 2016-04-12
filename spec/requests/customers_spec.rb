require "rails_helper"

RSpec.describe "Customers Spec", :type => :request do

  it "returns all customers in the index" do
    get "/api/v1/customers.json"
    expect(response.content_type).to eq("application/json")
  end

  it "returns a single customer" do
    customer = Customer.create(first_name: "helga", last_name: "johnson")
    get "/api/v1/customers/#{customer.id}.json"
    expect(response.content_type).to eq("application/json")
  end

  it "finds a customer by name case insensitive" do
    customer = Customer.create(first_name: "helga", last_name: "johnson")
    get "/api/v1/customers/find?first_name=#{customer.first_name.upcase}"
    expect(response.content_type).to eq("application/json")
  end
  
  it "finds all customers" do
    customer = Customer.create(first_name: "helga", last_name: "johnson")
    customer = Customer.create(first_name: "helga", last_name: "neato")
    get "/api/v1/customers/find_all?first_name=#{customer.first_name.upcase}"
    expect(response.content_type).to eq("application/json")
  end
end
