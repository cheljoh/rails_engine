module Api
  module V1
    class RandomInvoiceItemsController < ApiController
      respond_to :json

      def show
        respond_with Item.limit(1).order("RANDOM()") #could also try .first, not limit
      end

    end
  end
end
