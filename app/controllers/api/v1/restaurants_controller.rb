module Api
  module V1
    class RestaurantsController < ApplicationController
      def index
        restaurants = Restaurant.all

        render json: {
          restaurants: restaurants
        }, status: :ok
        # リクエストが成功
      end
    end
  end
end
