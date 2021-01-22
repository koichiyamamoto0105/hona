class RenameSpotIdColumnToHashtagSpots < ActiveRecord::Migration[5.2]
  def change
    rename_column :hashtag_spots, :spot_id, :map_id
  end
end
