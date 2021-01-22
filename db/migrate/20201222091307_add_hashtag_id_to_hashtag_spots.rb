class AddHashtagIdToHashtagSpots < ActiveRecord::Migration[5.2]
  def change
    add_reference :hashtag_spots, :hashtag, foreign_key: true
    add_reference :hashtag_spots, :map, foreign_key: true
    add_reference :hashtag_spots, :comment, foreign_key: true
  end
end
