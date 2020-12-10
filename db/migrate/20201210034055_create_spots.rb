class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.text :spot_name
      t.text :spot_image
      t.text :address
      t.float :latitude
      t.float :longtitude
      t.text :body

      t.timestamps
    end
  end
end
