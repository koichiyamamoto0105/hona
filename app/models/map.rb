class Map < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :spotname, presence: true

  geocoded_by :address
  before_validation :geocode

  attachment :image

  def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
