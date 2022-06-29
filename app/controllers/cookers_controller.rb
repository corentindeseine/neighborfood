class CookersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @cookers = User.cookers.all_except(current_user)
    @orders = Order.all
    @markers = @cookers.geocoded.map do |cooker|
      {
        lat: cooker.latitude,
        lng: cooker.longitude,
        image_url: Cloudinary::Utils.cloudinary_url(cooker.image.url),
        user_id: cooker.id
      }
    end
  end

  def show
    @cooker = User.find(params[:id])
    @meals = @cooker.meals.select { |meal| meal.available_quantity.positive? }
    @order = Order.find_by(client: current_user, cooker: @cooker, status: 0) || Order.new(client: current_user, cooker: @cooker)
    @orderdetail = OrderDetail.find_by(order: @order) || OrderDetail.new
    @quantity = @orderdetail.ordered_quantity || 1
    @old_order = Order.find_by(client: current_user.id, status: 0)
    @review = Review.new
  end
end
