require 'rails_helper'

RSpec.describe Merchant, type: :model do
  include SpecHelpers
  it { should have_many :invoices }
  it { should have_many :items }
  it { should have_many :transactions }
  it { should have_many :customers }

  it "should get total revenue" do
    make_transactions

    merchant1 = Merchant.first
    merchant2 = Merchant.last

    expect(merchant1.get_revenue).to eq(370.35)
    expect(merchant2.get_revenue).to eq(123.45)
  end

  it "should get total revenue on a date" do
    make_transactions_intell

    merchant = Merchant.first
    date = "Wed, 13 Apr 2016 16:50:50 UTC +00:00".to_datetime

    expect(merchant.get_revenue(date)).to eq(370.35)
  end

  it "should get total revenue for all  merchants on a date" do
    make_transactions

    date = "Wed, 13 Apr 2016 16:50:50 UTC +00:00".to_datetime

    expect(Merchant.total_revenue_on_date(date)).to eq(370.35)
  end

  it "should rank merchants by most revenue on a date" do
    make_transactions

    date = "Wed, 13 Apr 2016 16:50:50 UTC +00:00".to_datetime

    expect(Merchant.total_revenue_on_date(date)).to eq(370.35)
  end

  it "should rank merchants by most items sold" do
    make_transactions

    merchant = Merchant.first

    merchants = Merchant.merchants_ranked_by_most_items_sold(2)

    expect(merchants.first['id']).to eq(merchant.id)
  end

  it "should return total revenue for all  merchants by date" do
    make_transactions

    merchant = Merchant.first

    date = "Wed, 13 Apr 2016 16:50:50 UTC +00:00".to_datetime

    revenue = Merchant.total_revenue_on_date(date)

    expect(revenue).to eq(370.35)
  end

  it "should rank merchants by most revenue" do
    make_transactions

    merchant1 = Merchant.first
    merchant2 = Merchant.last

    merchants = Merchant.merchants_ranked_by_most_revenue(2)

    expect(merchants.first['id']).to eq(merchant1.id)
    expect(merchants.last['id']).to eq(merchant2.id)
    expect(merchants.count).to eq(2)
  end

  it "finds successful invoice items" do
    make_transactions_pending

    merchant1 = Merchant.first
    merchant2 = Merchant.last

    invoice1 = merchant1.successful_invoice_items
    invoice2 = merchant2.successful_invoice_items

    expect(invoice1.count).to eq(1)
    expect(invoice2.count).to eq(1)
  end

  it "finds customers with pending invoices" do
    make_transactions_pending
    customer = Customer.first
    merchant = Merchant.first
    customers = merchant.customers_with_pending_invoices
    expect(customers.first['id']).to eq(customer.id)
    expect(customers.count).to eq(1)
  end

  it "finds favorite customer" do
    make_transactions
    customer = Customer.first
    merchant = Merchant.first

    expect(merchant.favorite_customer).to eq(customer)
  end

  it "finds customers with successful transactions" do
    make_transactions_pending
    merchant = Merchant.first

    customers = merchant.customers_with_successful_transactions
    expect(customers.count).to eq(2)
  end

end
