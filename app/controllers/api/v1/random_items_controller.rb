module Api
  module V1
    class RandomItemsController < ApiController
      respond_to :json

      def show
        respond_with Item.limit(1).order("RANDOM()")
      end

    end
  end
end
