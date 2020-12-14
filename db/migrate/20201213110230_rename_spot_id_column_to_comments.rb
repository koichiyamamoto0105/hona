class RenameSpotIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :spot_id, :map_id
  end
end
