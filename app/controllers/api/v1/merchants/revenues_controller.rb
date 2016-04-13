module Api
  module V1
    module Merchants
      class RevenuesController < ApiController
        respond_to :json

        def show 
          merchant = Merchant.find(merchant_params[:merchant_id])
          invoice_sum = {revenue: merchant.get_revenue.to_s}
          respond_with invoice_sum
        end

        private

        def merchant_params
          params.permit(:merchant_id)
        end
      end
    end
  end
end
