class Admin::SlidersController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  before_action :set_slide, only: [:edit, :destroy, :update]

  def index
    @slides = Slider.unscoped.all    
  end

  def new
    @slide = Slider.new
  end

  def create
    @slide = Slider.new(slide_params)
    if @slide.save
      redirect_to admin_sliders_path
    else
      render 'new'
    end 
  end

  def destroy 
    @slide.destroy
    redirect_to admin_sliders_path, flash: { success: "Slide eliminada" }
  end

  def edit
    render 'edit'
  end

  def update
    @slide.update_attributes slide_params
    if @slide.save
      redirect_to admin_sliders_path, :flash => { :success => "Slide actualizada" }
    else
      render 'edit'
    end 
  end
  
  private
  def slide_params
    params.require(:slider).permit(:active, :description, :picture, :title)
  end

  def set_slide
    @slide = Slider.find(params[:id])
  end
end
