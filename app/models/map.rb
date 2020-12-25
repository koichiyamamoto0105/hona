class Map < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :latitude, presence: true, :uniqueness => { scope: [:spotname]}
  validates :longitude, presence: true, :uniqueness => { scope: [:spotname]}
  validates :spotname, presence: true

  geocoded_by :address
  before_validation :geocode

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.create_all_ranks
   Map.find(Favorite.group(:map_id).order('count(map_id) desc').limit(3).pluck(:map_id))
  end

  # def self.create_country_ranks
  #   results = {}
  #   countries = User.group(:country).pluck(:country)
  #   countries.each do |country|
  #   result = Map.find(Favorite.joins(:user).where("users.country='#{country}'").group(:map_id).order('count(map_id) desc').limit(3).pluck(:map_id))
  #   results[country] = result
  # end
  # end

  def self.search_for(content, method)
    if method == 'perfect'
      Map.where(spotname: content)
    elsif method == 'forward'
      Map.where('spotname LIKE ?', content + '%')
    elsif method == 'backward'
      Map.where('spotname LIKE ?', '%' + content)
    else
      Map.where('spotname LIKE ?', '%' + content + '%')
    end
  end

end
