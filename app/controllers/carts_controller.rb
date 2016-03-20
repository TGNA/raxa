class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @order_items = current_order.order_items
  end

  def checkout
    if current_order.subtotal >= 450
      current_order.checkout
      session[:order_id] = nil
      redirect_to root_path, flash: { success: "Compra realizada perfectamente" }
    else
      redirect_to root_path, flash: { error: "Pedido minimo 450€" }
    end
  end
end
