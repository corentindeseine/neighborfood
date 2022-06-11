class CookersController < ApplicationController

  def index
    @cookers = User.cookers
    @meals = Meal.all
  end

  def show
    @cooker = User.find(params[:id])
    @meals = @cooker.meals
  end
end
