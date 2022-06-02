class CookersController < ApplicationController
  def index
    @cookers = User.all # User.meals.length > 0
  end

  def show
    @cooker = Cooker.find(params[:id])
  end
end
