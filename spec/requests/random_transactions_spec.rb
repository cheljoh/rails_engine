require "rails_helper"

RSpec.describe "Random Transactions Spec", :type => :request do

  it "finds a random transaction" do
    customer1 = Customer.create(first_name: "Hello", last_name: "Julia")
    merchant1 = Merchant.create(name: "Cool Things")
    invoice1 = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id, status: "shipped")
    transaction1 = Transaction.create(invoice_id: invoice1.id, credit_card_number: "4654405418249632", result: "success")
    customer2 = Customer.create(first_name: "Uh oh", last_name: "Julia")
    merchant2 = Merchant.create(name: "Cool Things")
    invoice2 = Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id, status: "shipped")
    transaction2 = Transaction.create(invoice_id: invoice2.id, credit_card_number: "4654405418249632", result: "success")
    get "/api/v1/transactions/random"
    expect(response.content_type).to eq("application/json")

    transaction = JSON.parse(response.body).last

    expect(response).to be_success
    expect(response.content_type).to eq("application/json")
    expect(transaction).to have_key("id")
  end
end
