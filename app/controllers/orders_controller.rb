class OrdersController < ApplicationController
  def index
    @current_user_orders = Order.where(["client_id = ?", current_user.id])
  end

  def show
    @order = Order.find(params[:id])
    @orderdetails = @order.order_details
    @meals = Meal.all
  end

  def create
    @order = Order.new(order_params)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params_validation)
    redirect_to order_path(@order)
  end

  private

  def order_params_validation
    params.require(:order).permit(:status)
  end
end
