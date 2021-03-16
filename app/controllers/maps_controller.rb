class MapsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :country,:index, :show, :search]

  def top
    @all_ranks = Map.create_all_ranks
    @map = Map.new
    @maps = Map.all
  end

  def country
    @country_ranks = Map.create_country_ranks
  end

  def index
    @map = Map.new
    @maps = Map.all
  end

  def create
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
    @map_new = Map.new
    @comment = Comment.new
    @comments = @map.comments.page(params[:page]).per(3)
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
    params.require(:map).permit(:address, :latitude, :longitude, :spotname)
  end

  def comment_params
    params.require(:comment).permit(:title, :comment, :image, :star)
  end

end
