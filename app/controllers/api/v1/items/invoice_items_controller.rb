module Api
  module V1
    module Items
      class InvoiceItemsController < ApiController
        respond_to :json

        def index
          respond_with Item.find(item_params[:item_id]).invoice_items
        end

        private

        def item_params
          params.permit(:item_id)
        end
      end
    end
  end
end
