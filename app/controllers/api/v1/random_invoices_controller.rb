module Api
  module V1
    class RandomInvoicesController < ApiController
      respond_to :json

      def show
        respond_with Invoice.limit(1).order("RANDOM()")
      end
    end
  end
end
