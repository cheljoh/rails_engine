module Api
  module V1
    class RandomCustomersController < ApiController
      respond_to :json

      def show
        respond_with Customer.limit(1).order("RANDOM()")
      end
    end
  end
end
