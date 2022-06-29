class OrdersController < ApplicationController
  def index
    @current_user_orders = Order.where(["client_id = ?", current_user.id])
  end

  def cart
    @order = current_user.current_order
    if @order
      @orderdetails = @order.order_details
      @cooker = @order.cooker || @cooker
      @chatroom = Chatroom.new
      @single_chatroom = Chatroom.find_by(client: current_user, cooker: @cooker) ||
                        Chatroom.find_by(client: @cooker, cooker: current_user) ||
                        Chatroom.create_private_chatroom(@cooker, current_user)
    end
  end

  def show
    @order = Order.find(params[:id])
    @orderdetails = @order.order_details.includes(:meal)
    @cooker = @order.cooker
    @chatroom = Chatroom.new
    @review = Review.new
    @single_chatroom = Chatroom.find_by(client: current_user, cooker: @cooker) ||
                       Chatroom.find_by(client: @cooker, cooker: current_user) ||
                       Chatroom.create_private_chatroom(@cooker, current_user)
    @message = Message.new
    @messages = @single_chatroom.messages.order(created_at: :asc) if @single_chatroom
  end

  def update
    @order = Order.find(params[:id])
    @cooker = @order.cooker
    @order.update(status: 1)

    order_details = OrderDetail.where(order_id: @order)
    order_details.each do |detail|
      meal = Meal.find(detail.meal_id)
      meal.available_quantity -= detail.ordered_quantity
      meal.save
    end

    redirect_to order_path(@order)
  end
end
