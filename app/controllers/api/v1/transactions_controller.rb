module Api
  module V1
    class TransactionsController < ApiController
      respond_to :json
      def index
        if transaction_params
          respond_with Transaction.where(transaction_params)
        else
          respond_with Transaction.all
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
