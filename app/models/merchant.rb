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
end
