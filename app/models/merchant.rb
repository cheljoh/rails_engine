class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def get_revenue(date = nil)
    if date
      on_date = successful_invoice_items.where("invoices.created_at = ?", date)
      on_date.sum("unit_price * quantity").to_f
    else
      successful_invoice_items.sum("unit_price * quantity").to_f
    end
  end

  def self.total_revenue_on_date(date)
    Merchant.select("sum(invoice_items.unit_price * invoice_items.quantity) AS total_revenue").
            joins(:invoices => [:transactions, :invoice_items]).
            where("result = 'success'").
            where("invoices.created_at = ?", date).
            reorder("total_revenue").
            first['total_revenue']
  end

  def self.merchants_ranked_by_most_revenue(quantity)
    Merchant.select("id", "name", "sum(invoice_items.unit_price * invoice_items.quantity) AS revenue").
            joins(:invoices => [:transactions, :invoice_items]).
            where("result = 'success'").
            group("id").
            reorder("revenue DESC").
            take(quantity)
  end

  def self.merchants_ranked_by_most_items_sold(quantity)
    Merchant.select("id", "name", "sum(invoice_items.quantity) as revenue").
            joins(:invoices => [:transactions, :invoice_items]).
            where("result = 'success'").
            group("id").
            order("revenue desc").
            take(quantity)
  end

  def successful_invoice_items
    invoices.joins(:transactions, :invoice_items).where("result = 'success'")
  end

  def customers_with_pending_invoices
    failed_invoices = invoices.joins(:transactions, :invoice_items).where("result = 'failed'")
    customer_ids = failed_invoices.pluck(:customer_id).uniq
    customer_ids.map do |id|
      Customer.find(id)
    end
  end

  def favorite_customer
    customer_hash = Hash.new(0)
    customers = customers_with_successful_transactions
    self.invoices.each do |invoice|
      customers.each do |customer|
        if customer.id == invoice.customer_id
          customer_hash[customer.id] += 1
        end
      end
    end
    customer_id = customer_hash.max_by do |customer_id, number_of_orders|
      number_of_orders
    end
    Customer.find(customer_id[0])
  end

  def customers_with_successful_transactions
    Customer.joins(:invoices, :transactions).where("transactions.result = 'success'")
  end
end
