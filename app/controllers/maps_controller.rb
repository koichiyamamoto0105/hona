class MapsController < ApplicationController

  def top
  end

  def index
    @map = Map.new
    # @user = @map.user
    @maps = Map.all
  end

  def create
    # byebug
    @map = Map.new(map_params)
    @map.user_id = current_user.id
    if @map.save
      redirect_to map_path(@map.id)
    else
      @maps = Map.all
      render :index
    end
  end

  def show
    @map = Map.find(params[:id])
    @user = @map.user
    @map_new = Map.new
    # @maps = Map.all
    # @maps = Map.where(id: id)
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])
    if @map.user_id = current_user.id
    if @map.update(map_params)
      redirect_to maps_path
    else
      render :edit
    end
    end
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to maps_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :profile_image, :country)
  end

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :title, :comment, :spotname, :image)
  end
end
