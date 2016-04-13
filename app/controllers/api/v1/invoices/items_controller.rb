module Api
  module V1
    module Invoices
      class ItemsController < ApiController
        respond_to :json

        def index
          respond_with Invoice.find(invoice_params[:invoice_id]).items
        end

        private

        def invoice_params
          params.permit(:invoice_id)
        end
      end
    end
  end
end
