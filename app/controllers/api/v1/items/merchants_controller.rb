module Api
  module V1
    module Items
      class MerchantsController < ApiController
        respond_to :json

        def show
          respond_with Item.find(item_params[:item_id]).merchant
        end

        private

        def item_params
          params.permit(:item_id)
        end
      end
    end
  end
end
