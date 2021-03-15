class Hashtag < ApplicationRecord
  validates :hashname, length: { maximum:50}
  has_many :hashtag_spots, dependent: :destroy
  has_many :comments, through: :hashtag_spots
  has_many :maps, through: :hashtag_spots

  def self.search_for(content, method)
    if method == 'perfect'
      Hashtag.where(hashname: content)
    elsif method == 'forward'
      Hashtag.where('hashname LIKE ?', content+'%')
    elsif method == 'backward'
      Hashtag.where('hashname LIKE ?', '%'+content)
    else
      Hashtag.where('hashname LIKE ?', '%'+content+'%')
    end
  end

end
