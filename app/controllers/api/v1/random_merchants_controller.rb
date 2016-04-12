module Api
  module V1
    class RandomMerchantsController < ApiController
      respond_to :json

      def show
        respond_with Merchant.limit(1).order("RANDOM()")
      end

    end
  end
end
