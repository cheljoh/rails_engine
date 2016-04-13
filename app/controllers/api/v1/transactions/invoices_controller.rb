module Api
  module V1
    module Transactions
      class InvoicesController < ApiController
        respond_to :json

        def show
          respond_with Transaction.find(transaction_params[:transaction_id]).invoice
        end

        private

        def transaction_params
          params.permit(:transaction_id)
        end
      end
    end
  end
end
