class Post < ApplicationRecord

	belongs_to :user
	has_many :favorites
	has_many :favolited_users, through: :likes, source: :user
	has_many :comments, dependent: :destroy
end
