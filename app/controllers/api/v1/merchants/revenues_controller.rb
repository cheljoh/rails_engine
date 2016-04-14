module Api
  module V1
    module Merchants
      class RevenuesController < ApiController
        respond_to :json

        def show
          merchant = Merchant.find(merchant_params[:merchant_id])
          if merchant_params.has_key?(:date)
            invoice_sum = {revenue: merchant.get_revenue(merchant_params[:date].to_datetime).to_s}
          else
            invoice_sum = {revenue: merchant.get_revenue.to_s}
          end
          respond_with invoice_sum
        end

        private

        def merchant_params
          params.permit(:merchant_id, :date)
        end
      end
    end
  end
end
