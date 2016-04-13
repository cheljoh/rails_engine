module Api
  module V1
    module Customers
      class TransactionsController < ApiController
        respond_to :json

        def index
          respond_with Customer.find(customer_params[:customer_id]).transactions
        end

        private

        def customer_params
          params.permit(:customer_id)
        end
      end
    end
  end
end
