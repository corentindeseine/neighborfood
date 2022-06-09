class CookersController < ApplicationController
  # before_action :set_meal, only: [:show]

  def index
    @cookers = User.cookers
    @meals = Meal.all
  end

  def show
    @cooker = User.find(params[:id])
    @meals = @cooker.meals
  end

  # private

  # def set_meal
  #   @meal = Meal.find(params[:id])
  # end
end
