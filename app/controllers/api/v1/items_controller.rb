module Api
  module V1
    class ItemsController < ApiController
      respond_to :json

      def index
        if item_params
          respond_with Item.where(item_params)
        else
          respond_with Item.all
        end
      end

      def show
        respond_with Item.find_by(item_params)
      end

      private

      def item_params
        params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
      end
    end
  end
end
