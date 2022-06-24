class MealsController < ApplicationController
  # before_action :set_cooker, only: [:new, :show, :create]

  def show
    @meals = Meal.all
    @cooker = User.find(params[:cooker_id])
    @meal = @cooker.meals.find(params[:id])
    @orderdetail = OrderDetail.new
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

 def update
  @meal = Meal.find(params[:id])
  @meal.update(meal_params)
  redirect_to profil_path(@cooker)
 end
  private

  # def set_cooker
  #   @cooker = User.find(params[:cooker_id])
  # end


  def meal_params
    params.permit(:name, :description, :unit_price, :ingredients, :range_date_time, :available_quantity, :image)
  end
end
