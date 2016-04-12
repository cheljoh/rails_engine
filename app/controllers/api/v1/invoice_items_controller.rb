module Api
  module V1
    class InvoiceItemsController < ApiController
      respond_to :json

      def index
        respond_with InvoiceItem.all
      end

      def show
        respond_with InvoiceItem.find_by(invoice_items_params)
      end

      def invoice_items_params
        params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
      end
    end
  end
end
