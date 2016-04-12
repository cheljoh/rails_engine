class ChangeCreditCardAndResultFormatInTransactions < ActiveRecord::Migration
  def change
    enable_extension("citext")
    change_column :transactions, :credit_card_number, :citext
    change_column :transactions, :result, :citext
  end
end
