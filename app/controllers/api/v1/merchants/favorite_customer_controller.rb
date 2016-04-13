module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApiController
        respond_to :json

        def show
          merchant = Merchant.find(merchant_params[:merchant_id])
          customer = merchant.favorite_customer
          respond_with customer
        end

        private

        def merchant_params
          params.permit(:merchant_id)
        end
      end
    end
  end
end
