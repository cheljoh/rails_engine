require "rails_helper"

RSpec.describe "Random Customers Spec", :type => :request do

  it "finds a random customer" do
    customer = Customer.create(first_name: "helga", last_name: "johnson")
    customer = Customer.create(first_name: "helga", last_name: "neato")
    get "/api/v1/customers/random"
    customer = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json") #need to Json.parse body
    expect(customer).to have_key("id")
  end
end
