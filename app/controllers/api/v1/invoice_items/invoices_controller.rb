module Api
  module V1
    module InvoiceItems
      class InvoicesController < ApiController
        respond_to :json

        def show
          respond_with InvoiceItem.find(invoice_item_params[:invoice_item_id]).invoice
        end

        private

        def invoice_item_params
          params.permit(:invoice_item_id)
        end
      end
    end
  end
end
