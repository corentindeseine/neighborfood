class MealsController < ApplicationController
  # before_action :set_cooker, only: [:new, :show, :create]
  def show
    @meals = Meal.all
    @cooker = User.find(params[:cooker_id])
    @meal = @cooker.meals.find(params[:id])
  end

  def new
    @cooker = User.find(params[:cooker_id])
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.cooker_id = @cooker.id
    if @meal.save
      redirect_to @meal
    else
      render 'new'
    end
  end

  private

  # def set_cooker
  #   @cooker = User.find(params[:cooker_id])
  # end

  def meal_params
    params.require(:meal.permit(:name, :description, :ingredients, :range_date_time, :available_quantity, :image))
  end
end
