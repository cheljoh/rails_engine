require "rails_helper"

RSpec.describe "Random Customers Spec", :type => :request do

  it "finds a random customer" do
    customer = Customer.create(first_name: "helga", last_name: "johnson")
    customer = Customer.create(first_name: "helga", last_name: "neato")
    get "/api/v1/customers/random"
    expect(response.content_type).to eq("application/json")
  end
end
