class OrderDetailsController < ApplicationController

  def create
    @cooker = User.find(params[:cooker_id])
    @meal = Meal.find(params[:meal_id])
    @order = Order.find_or_create_by(client_id: current_user.id, cooker_id: @cooker.id, status: 0)
    @orderdetail = OrderDetail.where(meal_id: @meal.id, order_id: @order.id)
    if @orderdetail
      @orderdetail.upsert(ordered_quantity: 8)
    else
      @orderdetail = OrderDetail.new(order_id: @order.id, ordered_quantity: 3, meal_id: @meal.id)
    end

    if @orderdetail.save
      redirect_to cooker_path(@cooker)
    else
      render "cooker"
    end
  end

  def update
    @orderdetail = OrderDetail.find(params[:id])
    @orderDetail.update(ordersdetails_params_validation)
    redirect_to order_path(@order)
  end

  def destroy
  end
end
