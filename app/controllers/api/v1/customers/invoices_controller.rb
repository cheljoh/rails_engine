module Api
  module V1
    module Customers
      class InvoicesController < ApiController
        respond_to :json

        def index
          respond_with Customer.find(customer_params[:customer_id]).invoices
        end

        private

        def customer_params
          params.permit(:customer_id)
        end
      end
    end
  end
end
