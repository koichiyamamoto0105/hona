class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :map
  
  
  validates :title, presence: true length: { in: 1..50 }
  validates :comment, presence: true length: { in: 1..1000 }
  validates :star, presence: true

  attachment :image

end
