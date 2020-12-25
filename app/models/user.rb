class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :maps
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_maps, through: :favorites, source: :map

  attachment :profile_image

  validates :name, presence: true, length: { maximum: 20, minimum: 2 }
  validates :nickname, presence: true
  validates :country, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def country_name
    c = ISO3166::Country[country]
    c.translations[I18n.locale.to_s] || c.name
  end
end
