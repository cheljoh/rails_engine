module Api
  module V1
    module Invoices
      class MerchantsController < ApiController
        respond_to :json

        def show
          respond_with Invoice.find(invoice_params[:invoice_id]).merchant
        end

        private

        def invoice_params
          params.permit(:invoice_id)
        end
      end
    end
  end
end
