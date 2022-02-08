class Api::V1::LineFoodsController < ApplicationController

  before_action :set_food, only: %i[create]

  def create
    if LineFood.active.other_restaurant(@orderd_food.restaurant.id).exists?
      return render json:{
        existing_restaurant: LineFood.other_restaurant(@orderd_food.restaurant.id).first.restaurant.name,
        new_restaurant: Food.find(params[:food_id]).restaurant.name,
      }, status: :not_acceptable
    end

    set_line_food(@ordered_food) # private内メソッドの呼び出し

    if @line_food.save
      render json: {
        line_food: @line_food
      }, status: :created
    else
      render json: {}, status: :internal_server_error
    end
  end

private

  def set_food
    @ordered_food = Food.find(params[:food_id])
  end

  def set_line_food(ordered_food)
    if ordered_food.line_food.present?
      @line_food = orderd_food.line_food
      @line_food.attributes = {
        count: ordered_food.line_food.count + params[:count],
        active: true
      }
    else
      @line_food = ordered_food.build_line_food( # has_oneをbuildする時の書き方
        count: params[:count],
        restaurant: ordered_food.restaurant,
        active: true
      ) # この時点でbuildした@line_foodはまだ保存されていない
    end
  end
end
