class CommentsController < ApplicationController

  def create
    @map = Map.find(params[:map_id])
    @comment = Comment.new(comment_params)
    @comment.map_id = @map.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referer
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @map = Map.find(params[:id])
    comment = @map.comments.find(params[:id])
    comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :comment, :image)
  end

end
