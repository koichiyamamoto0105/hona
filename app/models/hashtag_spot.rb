class HashtagSpot < ApplicationRecord
  belongs_to :comment
  belongs_to :hashtag
  validates :comment_id, presence: true
  validates :hashtag_id, presence: true
end
