class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @map = Map.find(params[:map_id])
    @comment = Comment.new(comment_params)
    @comment.map_id = @map.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to map_path(@map.id)
    else
      # redirect_to request.referer
      @comments = @map.comments.page(params[:page]).per(3)
      render 'maps/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @map = Map.find(params[:map_id])
  	comment = @map.comments.find(params[:id])
		comment.destroy
		redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :comment, :image, :star)
  end

  # def user_params
  #   params.require(:user).permit(:name, :nickname, :profile_image, :country)
  # end

end
