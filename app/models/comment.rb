class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment_content, length: { maximum: 30 }, presence: true
end
