module Api
  module V1
    class RandomInvoiceItemsController < ApiController
      respond_to :json

      def show
        respond_with InvoiceItem.limit(1).order("RANDOM()")
      end

    end
  end
end
