class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :maps
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :name, length: {maximum: 20, minimum: 2}
  validates :nickname, presence: true
  validates :country, presence: true


 def country_name
   c = ISO3166::Country[self.country]
   return c.translations[I18n.locale.to_s] || c.name
 end

end
