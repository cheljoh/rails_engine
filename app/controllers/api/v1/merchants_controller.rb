module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json

      def index
        if merchant_params
          respond_with Merchant.where(merchant_params)
        else
          respond_with Merchant.all
        end
      end

      def show
        respond_with Merchant.find_by(merchant_params)
      end

      private

      def merchant_params
        params.permit(:id, :name, :created_at, :updated_at)
      end
    end
  end
end
