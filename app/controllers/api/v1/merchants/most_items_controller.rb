module Api
  module V1
    module Merchants
      class MostItemsController < ApiController
        respond_to :json

        def index
          respond_with Merchant.merchants_ranked_by_most_items_sold(params[:quantity])
        end
      end
    end
  end
end
