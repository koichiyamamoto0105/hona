class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :map


  validates :title, presence: true, length:  {minimum: 1, maximum: 50}
  validates :comment, presence: true, length: {minimum: 5, maximum: 500}
  validates :star, presence: true

  attachment :image

  def self.average_star
    stars = self.pluck(:star)
    average_star = 0
    stars.each do |star|
      average_star += star
    end
    begin
    average_star = average_star / stars.length
    rescue
      average_star = 0
    end
  end


end
