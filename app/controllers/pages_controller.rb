class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cookers = User.cookers
    @markers = @cookers.geocoded.map do |cooker|
      {
        lat: cooker.latitude,
        lng: cooker.longitude,
        image_url: Cloudinary::Utils.cloudinary_url(cooker.image.url),
        user_id: cooker.id
      }
    end
  end
end
