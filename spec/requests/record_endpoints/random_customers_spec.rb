require "rails_helper"

RSpec.describe "Random Customers Spec", :type => :request do
  include SpecHelpers

  it "finds a random customer" do
    make_customers

    get "/api/v1/customers/random"

    customer = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
  end
end
