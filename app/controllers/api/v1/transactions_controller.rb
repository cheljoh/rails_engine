module Api
  module V1
    class TransactionsController < ApiController
      respond_to :json

      def index
        if transaction_params.empty?
          respond_with Transaction.all
        else
          respond_with Transaction.where(transaction_params)
        end
      end

      def show
        respond_with Transaction.find_by(transaction_params)
      end

      private

      def transaction_params
        params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
      end
    end
  end
end
