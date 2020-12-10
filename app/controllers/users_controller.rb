class UsersController < ApplicationController

  def show
  end



  private
  def user_params
    params.require(:user).permit(:name, :nickname, :profile_image, :country)
  end

end
