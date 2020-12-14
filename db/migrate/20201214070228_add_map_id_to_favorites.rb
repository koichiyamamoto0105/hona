class AddMapIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :map_id, :integer
  end
end
