class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cookers = User.cookers
    @markers = @cookers.geocoded.map do |cooker|
      {
        lat: cooker.latitude,
        lng: cooker.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: cooker })
      }
    end
  end
end
