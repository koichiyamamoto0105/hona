class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]


  def show
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:map_id)  # ログイン中のユーザーのいいねのmap_idカラムを取得
    @favorite_list = Map.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:map_id)  # ログイン中のユーザーのいいねのmap_idカラムを取得
    @favorite_list = Map.find(favorites)
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :profile_image, :country)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
