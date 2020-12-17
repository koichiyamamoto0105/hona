class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @map = Map.find(params[:map_id])
    @comment = Comment.new(comment_params)
    @comment.map_id = @map.id
    @comment.user_id = current_user.id
    # @user.user_id = current_user.id
    # @user = User.find(params[:id])
    if @comment.save
      # redirect_to request.referer
      redirect_to map_path(@map.id)
    else
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
