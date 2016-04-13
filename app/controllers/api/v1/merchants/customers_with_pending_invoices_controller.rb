module Api
  module V1
    module Merchants
      class CustomersWithPendingInvoicesController < ApiController
        respond_to :json

        def index
          merchant = Merchant.find(merchant_params[:merchant_id])
          customers = merchant.customers_with_pending_invoices
          respond_with customers
        end

        private

        def merchant_params
          params.permit(:merchant_id)
        end
      end
    end
  end
end
