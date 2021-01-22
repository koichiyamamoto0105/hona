class AddIndexHashtagsHashname < ActiveRecord::Migration[5.2]
  def change
    add_index :hashtags, :hashname, unique: true
  end
end
