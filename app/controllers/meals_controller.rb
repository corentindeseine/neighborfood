class MealsController < ApplicationController
  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to @meal
    else
      render 'new'
    end
  end

  private

  def meal_params
    params.require(:meal.permit(:name, :description, :ingredients, :range_date_time, :available_quantity, :image))
  end
end
