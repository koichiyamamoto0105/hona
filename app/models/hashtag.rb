class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum:50}
  has_many :hashtag_spots, dependent: :destroy
  has_many :comments, through: :hashtag_spots
end
