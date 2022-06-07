class MealsController < ApplicationController
  def show
    @meal = Meal.find(params[:id])
  end

  def new
  end

  def create
  end

  private

  def meal_params
    params.require(:meal.permit(:name, :description, :ingredients, :range_date_time, :available_quantity, :image))
  end
end
