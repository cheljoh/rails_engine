module Api
  module V1
    module Invoices
      class CustomersController < ApiController
        respond_to :json

        def show
          respond_with Invoice.find(invoice_params[:invoice_id]).customer
        end

        private

        def invoice_params
          params.permit(:invoice_id)
        end
      end
    end
  end
end
