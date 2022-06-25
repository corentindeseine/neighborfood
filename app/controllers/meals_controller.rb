class MealsController < ApplicationController
  # before_action :set_cooker, only: [:new, :show, :create]

  def show
    @meals = Meal.all
    @cooker = User.find(params[:cooker_id])
    @meal = @cooker.meals.find(params[:id])
    @order = Order.find_by(client: current_user, cooker: @cooker, status: 0) || Order.new(client: current_user, cooker: @cooker)
    @orderdetail = OrderDetail.find_by(order: @order, meal: @meal) || OrderDetail.new
    @quantity = @orderdetail.ordered_quantity || 1
    @old_order = Order.find_by(client: current_user.id, status: 0)
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
