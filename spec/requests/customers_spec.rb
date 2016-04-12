require "rails_helper"

RSpec.describe "Customers Spec", :type => :request do

  it "returns all customers in the index" do
    customer1 = Customer.create(first_name: "helga", last_name: "johnson")
    customer2 = Customer.create(first_name: "helga", last_name: "neato")

    get "/api/v1/customers.json"

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(2)
  end

  it "returns a single customer" do
    customer = Customer.create(first_name: "helga", last_name: "johnson")

    get "/api/v1/customers/#{customer.id}.json"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(Customer.last.first_name)
    expect(response.content_type).to eq("application/json")
  end

  it "finds a customer by name case insensitive" do
    customer = Customer.create(first_name: "helga", last_name: "johnson")

    get "/api/v1/customers/find?first_name=#{customer.first_name.upcase}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(customer["first_name"]).to eq(Customer.last.first_name)
  end

  it "finds all customers given a parameter" do
    customer1 = Customer.create(first_name: "helga", last_name: "johnson")
    customer2 = Customer.create(first_name: "helga", last_name: "neato")
    customer3 = Customer.create(first_name: "olga", last_name: "neato")

    get "/api/v1/customers/find_all?first_name=#{customer1.first_name.upcase}"

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    customer_count = JSON.parse(response.body).count
    expect(customer_count).to eq(2)
  end
end
