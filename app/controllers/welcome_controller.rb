class WelcomeController < ApplicationController
  def index
    @slides = Slider.all
  end
  def about
  end
end
