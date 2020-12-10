class RenameLongtitudeColumnToSpots < ActiveRecord::Migration[5.2]
  def change
    rename_column :spots, :longtitude, :longitude
  end
end
