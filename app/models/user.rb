class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy

  attachment :profile_image # reffile

  validates :name, length: { maximum: 10 }
  validates :introduction, length: { maximum: 200 }
  validates :hobby, length: { maximum: 30 }

end
