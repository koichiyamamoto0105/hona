class MapsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :index, :show, :search]
  before_action :ensure_correct_user, only: [:update, :edit]

  def top
    @all_ranks = Map.create_all_ranks
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
    @stars = @comments.pluck(:star)
    @average_star = 0
    @stars.each do |star|
      @average_star += star
    end
    begin
      @average_star /= @stars.length
    rescue
      @average_star = 0
    end
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])
    if @map.update(map_params)
      redirect_to maps_path
    else
      render :edit
    end
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to maps_path
  end

  def search
    @maps = Map.search(params[:search])
  end

  # def hashtag
  #   @user = current_user
  #   @tag = Hashtag.find_by(hashname: params[:name])
  #   @maps = @tag.maps
  # end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :profile_image, :country)
  end

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :spotname)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
