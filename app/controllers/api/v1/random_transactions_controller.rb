module Api
  module V1
    class RandomTransactionsController < ApiController
      respond_to :json

      def show
        respond_with Transaction.limit(1).order("RANDOM()")
      end

    end
  end
end
