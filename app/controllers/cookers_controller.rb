class CookersController < ApplicationController
  def index
    @cookers = User.cookers
    @orders = Order.all
    @markers = @cookers.geocoded.map do |cooker|
      {
        lat: cooker.latitude,
        lng: cooker.longitude,
        image_url: Cloudinary::Utils.cloudinary_url(cooker.image.url),
        user_id: cooker.id,
      }
    end
  end

  def show
    @cooker = User.find(params[:id])
    @meals = @cooker.meals
    @review = Review.new
    @orderdetail = OrderDetail.new
  end
end
