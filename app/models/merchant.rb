class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def get_revenue(date = nil)
    invoices = successful_invoices
    if date
      on_date = invoices.where("invoices.created_at = ?", date)
      on_date.sum("unit_price * quantity").to_f
    else
      invoices.sum("unit_price * quantity").to_f
    end
  end

  def successful_invoices
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
    #Merchant.joins(:invoices).group(:customer_id).order('count_id DESC').limit(5).count(:id)
    #self.invoices.count(:customer_id)
    #Merchant.joins(:invoices).count(:customer_id)
    #Merchant.joins(:invoices).group(:customer_id).order('customer_id DESC').limit(1).count(:customer_id)
  end

  def customers_with_successful_transactions
    successful_customers = []
    customers.each do |customer|
      customer.invoices.each do |invoice|
        invoice.transactions.each do |transaction|
          successful_customers << customer if transaction.result == "success"
        end
      end
    end
  end
end
