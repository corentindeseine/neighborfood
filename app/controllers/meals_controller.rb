class MealsController < ApplicationController
  def show
    @meal = Meal.find(params[:id])
  end

  def new
  end

  def create
  end
end
