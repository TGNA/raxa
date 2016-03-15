class ProductsController < ApplicationController
  def index
    unless params[:category].nil?
      @products = Product.where(cat_id: params[:category]).page params[:page]
    else
      @products = Product.all.page params[:page]
    end

    @categories = ProductCategory.all
    @order_item = current_order.order_items.new
  end
  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end
end
