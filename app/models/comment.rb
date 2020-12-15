class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :map

  attachment :image

end
