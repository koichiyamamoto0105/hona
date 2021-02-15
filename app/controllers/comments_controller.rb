class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @map = Map.find(params[:map_id])
    @comment = Comment.new(comment_params)
    @comment.map_id = @map.id
    @comment.user_id = current_user.id
    if @comment.save
      # sleep(3)
      redirect_to map_path(@map.id)
    else
      @comments = @map.comments.page(params[:page]).per(3)
      render 'maps/show'
    end
  end

  def index
    @map = Map.find(params[:map_id])
    redirect_to map_path(@map.id)
  end

  def destroy
    @map = Map.find(params[:map_id])
    comment = @map.comments.find(params[:id])
    comment.destroy
    redirect_to map_path(@map.id)
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @comments = @tag.comments
  end

  def all_hashtag
    @user = current_user
    if params[:name].nil?
      @tags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.comments.count}
    else
      @tag = Hashtag.find_by(hashname: params[:name])
      @comments = @tag.comments.page(params[:page]).per(20).reverse_order
      @tags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.comments.count}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :comment, :image, :star)
  end

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude, :spotname)
  end

end
