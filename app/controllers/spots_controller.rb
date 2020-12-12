class SpotsController < ApplicationController
  def top
  end

  def index
    @spot = Spot.new
    @spots = Spot.all
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      @spots = Spot.all
      render 'spots/index'
    end
  end

  def show
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :spot_image, :address, :latitude, :longitude, :body)
  end

end
