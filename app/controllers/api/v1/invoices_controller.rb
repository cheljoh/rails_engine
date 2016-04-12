module Api
  module V1
    class InvoicesController < ApiController
      respond_to :json

      def index
        if invoice_params.empty?
          respond_with Invoice.all
        else
          respond_with Invoice.where(invoice_params)
        end
      end

      def show
        respond_with Invoice.find_by(invoice_params)
      end

      private

      def invoice_params
        params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
      end
    end
  end
end
