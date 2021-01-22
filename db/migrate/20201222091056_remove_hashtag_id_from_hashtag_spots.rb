class RemoveHashtagIdFromHashtagSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :hashtag_spots, :hashtag_id, :integer
    remove_column :hashtag_spots, :map_id, :integer
  end
end
