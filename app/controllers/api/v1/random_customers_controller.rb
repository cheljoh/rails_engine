module Api
  module V1
    class RandomCustomersController < ApiController
      respond_to :json

      def show
        # total_customers = Customer.count
        # random_number = rand(1..total_customers)
        # respond_with Customer.find(random_number)
        respond_with Customer.limit(1).order("RANDOM()")
      end

    end
  end
end
