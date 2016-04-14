module Api
  module V1
    module Merchants
      class TotalRevenueOnDateController < ApiController
        respond_to :json

        def index
          total_revenue = {total_revenue: Merchant.total_revenue_on_date(params[:date].to_datetime)}
          respond_with total_revenue
        end

        private

        def merchant_params
          params.permit(:date)
        end
      end
    end
  end
end
