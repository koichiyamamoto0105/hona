class MapsController < ApplicationController

  before_action :authenticate_user!, except: [:top, :index, :show, :search]

  def top
    @all_ranks = Map.create_all_ranks
    # @map = Map.find(params[:map_id])
    # @comment = @map.comments.find(params[:id])
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
    @comment = Comment.new
    # if @comment.star.blank?
    #   @average_star = 0
    # else
    #   @avarage_star = @comment.star.avarage(:star).round(2)
    # end
    @comments = @map.comments
    @stars = @comments.pluck(:star)
    @average_star = 0
    @stars.each do |star|
      @average_star += star
    end
    @average_star = @average_star / @stars.length
    
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])
    # if @map.user_id = current_user.id
    if @map.update(map_params)
      redirect_to maps_path
    else
      render :edit
    end
    # end
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to maps_path
  end

  def search
    @maps = Map.search(params[:search])
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :profile_image, :country)
  end

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :title, :comment, :spotname, :image)
  end

  # def comment_params
  #   params.require(:comment).permit(:title, :comment, :image, :star)
  # end

end