module Api
  module V1
    class CustomersController < ApiController
      respond_to :json

      def index
        if customer_params.empty?
          respond_with Customer.all
        else
          respond_with Customer.where(customer_params)
        end
      end

      def show
        respond_with Customer.find_by(customer_params)
      end

      private

      def customer_params
        params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
      end
    end
  end
end
