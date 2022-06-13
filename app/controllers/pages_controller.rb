class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cookers = User.cookers
    @markers = @cookers.geocoded.map do |cooker|
      {
        lat: cooker.latitude,
        lng: cooker.longitude,
        image_url: helpers.asset_url("sacha.png")
      }
    end
  end
end
