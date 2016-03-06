class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @order_items = current_order.order_items
  end

  def checkout
    current_order.checkout
    session[:order_id] = nil
    redirect_to root_path, flash: { success: "Compra realizada perfectamente" }
  end
end
