class OrdersController < ApplicationController
  def index
    @current_user_orders = Order.where(["client_id = ?", current_user.id])
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
    # @order.update(order_params)
    @order.update(status: 1)

    redirect_to order_path(@order)
  end

  private

  # def order_params_validation
  #   params.require(:order).permit(:status)
  # end

  # def order_params
  #   params.require(:order).permit(:status)
  # end
end
