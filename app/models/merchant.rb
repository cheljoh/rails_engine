class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def get_revenue
    invoices = successful_invoices
    invoices.sum("unit_price * quantity").to_f
  end

  def successful_invoices
    invoices.joins(:transactions, :invoice_items).where("result = 'success'")
  end
end
