class ProfilsController < ApplicationController
  def profil
    # @current_user_orders = Order.where(["client_id = ?", current_user.id])
    # @current_user_orders_cooker = Order.where(["cooker_id = ?", current_user.id])
    # @current_user_meals_cooker = Meal.where(["user_id = ?", current_user.id])
    @cooker = current_user
    @meals = @cooker.meals
    @current_user_orders_cooker_accepted = Order.where(["cooker_id = ? AND status = ?", current_user.id, 1])
    @meal = Meal.new
  end
end
