module Api
  module V1
    module Merchants
      class MostRevenueController < ApiController
        respond_to :json

        def index
          if merchant_params.has_key?(:date)
            top_merchants = Merchant.merchants_ranked_by_most_revenue(merchant_params[:quantity], merchant_params[:date].to_datetime)
          else
            top_merchants = Merchant.merchants_ranked_by_most_revenue(params[:quantity])
          end
          respond_with top_merchants
        end

        private

        def merchant_params
          params.permit(:merchant_id, :date)
        end
      end
    end
  end
end
