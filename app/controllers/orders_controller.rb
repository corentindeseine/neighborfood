class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def create
  end

  def update
  end
end
