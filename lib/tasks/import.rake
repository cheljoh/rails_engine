require 'csv' #could also be in application.rb

namespace :import do

  desc "Import merchants from csv"
  task merchants: :environment do #envt gives you access to users
    CSV.foreach("data/merchants.csv", headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  desc "Import invoices from csv"
  task invoices: :environment do 
    CSV.foreach("data/invoices.csv", headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end
end
