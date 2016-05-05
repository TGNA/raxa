class ProductsController < ApplicationController
  def index
    if params[:search]
      @products = Product.search(params[:search]).page params[:page]
    else
      unless params[:category].nil?
        @products = Product.where(cat_id: params[:category]).page params[:page]
      else
        @products = Product.all.page params[:page]
      end
    end

    @categories = ProductCategory.all
    @order_item = current_order.order_items.new
  end
  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end

  def familias
    @categories = ProductCategory.all
  end
end
