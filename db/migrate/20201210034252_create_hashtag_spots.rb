class CreateHashtagSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_spots do |t|
      t.integer :hashtag_id
      t.integer :spot_id

      t.timestamps
    end
  end
end
