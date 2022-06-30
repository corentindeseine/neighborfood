class OrderDetailsController < ApplicationController

  def create
    @cooker = User.find(params[:cooker_id])
    @meal = Meal.find(params[:meal_id])
    @order = Order.find_or_create_by(client_id: current_user.id, cooker_id: @cooker.id, status: 0)
    @orderdetail = OrderDetail.find_by(order_id: @order.id, meal_id: @meal.id)
    @old_order = Order.find_by(client: current_user.id, status: 0)
    @old_chatroom = Chatroom.find_by(client: current_user, cooker: @old_order.cooker) ||
                    Chatroom.find_by(client: @old_order.cooker, cooker: current_user)

    if @old_order && @old_chatroom
      @old_order.destroy if @old_order.cooker_id != @cooker.id
      @old_chatroom.destroy if @old_chatroom.messages.empty?
    end
      if @orderdetail
        @orderdetail.update(ordered_quantity: @orderdetail.ordered_quantity)
      else
        @orderdetail = OrderDetail.new(order_details_params)
        @orderdetail.order = @order
        @orderdetail.meal = @meal
      end
      if @orderdetail.save
        redirect_to cooker_path(@cooker)
      else
        redirect_to cooker_path(@cooker), warning: "Nope"
      end
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_details_params)
      redirect_to cooker_path(@order_detail.meal.user)
    else
      render 'meals/show'
    end
  end

  def destroy
    @order = Order.find_or_create_by(client_id: current_user.id, status: 0)
    @order.destroy
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:ordered_quantity)
  end
end
