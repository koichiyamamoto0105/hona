class FavoritesController < ApplicationController

  def create
  @map = Map.find(params[:map_id])
  favorite = @map.favorites.new(user_id: current_user.id)
  favorite.save
  end

  def destroy
    @map = Map.find(params[:map_id])
    favorite = @map.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end

end
