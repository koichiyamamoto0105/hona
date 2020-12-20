class Map < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy




  validates :latitude, presence: true, :uniqueness => {:scope => :longitude}
  validates :longitude, presence: true, :uniqueness => {:scope => :latitude}
  validates :spotname, presence: true

  geocoded_by :address
  before_validation :geocode

  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end

  def self.create_all_ranks
    Map.find(Favorite.group(:map_id).order('count(map_id) desc').limit(3).pluck(:map_id))
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Map.where(spotname: content)
    elsif method == 'forward'
      Map.where('spotname LIKE ?', content+'%')
    elsif method == 'backward'
      Map.where('spotname LIKE ?', '%'+content)
    else
      Map.where('spotname LIKE ?', '%'+content+'%')
    end
  end

end
