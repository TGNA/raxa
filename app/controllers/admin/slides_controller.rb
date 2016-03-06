class Admin::SlidesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_scan, only: [:show, :destroy, :update]

  def index
    @slides = Slider.unscoped.all    
  end

  def new
    @slide = Slider.new
  end

  def create
    @slide = Slider.new(slide_params)
    if @slide.save
      redirect_to admin_slides_path
    else
      render 'new'
    end 
  end

  def show
  end

  def destroy 
    @slide.destroy
    redirect_to admin_slides_path, flash: { success: "Slide eliminada" }
  end

  def edit
    render 'edit'
  end

  def update
    @taggable.update_attributes slide_params
    if @taggable.save
      redirect_to taggable_path(@taggable), :flash => { :success => t(".taggable_update") }
    else
      render 'edit'
    end 
  end
  
  private
  def slide_params
    params.require(:slide).permit(:active, :description, :picture, :title)
  end

  def set_slide
    @slide = Slider.find(params[:id])
  end
end
