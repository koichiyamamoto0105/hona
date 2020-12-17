class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :map


  validates :title, presence: true, length:  {minimum: 1, maximum: 50}
  validates :comment, presence: true, length: {minimum: 5, maximum: 500}
  validates :star, presence: true

  attachment :image

end
