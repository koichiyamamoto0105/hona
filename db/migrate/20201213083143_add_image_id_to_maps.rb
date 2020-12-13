class AddImageIdToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :image_id, :string
    add_column :maps, :spotname, :string
  end
end
