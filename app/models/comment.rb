class Comment < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :map
  has_many :hashtag_spots, dependent: :destroy
  has_many :hashtags, through: :hashtag_spots

  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  validates :comment, presence: true, length: { minimum: 5, maximum: 500 }
  validates :star, presence: true

  attachment :image

  def self.average_star
    stars = pluck(:star)
    average_star = 0
    stars.each do |star|
      average_star += star
    end
    begin
      average_star /= stars.length
    rescue
      average_star = 0
    end
  end


  after_create do
    comment = Comment.find_by(id: self.id)
    hashtags  = self.comment.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    comment.hashtags = []
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      comment.hashtags << tag
    end
  end

  before_update do
    comment = Comment.find_by(id: self.id)
    comment.hashtags.clear
    hashtags = self.comment.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      comment.hashtags << tag
    end
  end

end
