class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favolited_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  attachment :post_image # refile

  acts_as_taggable #タグ付け機能

  # いいねされているかどうか
  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
