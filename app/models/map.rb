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

  def self.create_all_ranks #Noteクラスからデータを取ってくる処理なのでクラスメソッド！
    Map.find(Favorite.group(:map_id).order('count(map_id) desc').limit(3).pluck(:map_id))
  end

  def self.search(search)
    return Map.all unless search
    Map.where(['content LIKE ?', "%#{search}%"])
  end

end
