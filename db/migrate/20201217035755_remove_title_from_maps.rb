class RemoveTitleFromMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :title, :text
    remove_column :maps, :comment, :text
    remove_column :maps, :image_id, :string
  end
end
