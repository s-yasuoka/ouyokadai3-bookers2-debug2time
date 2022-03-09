class Book < ApplicationRecord
  # has_many :user
  belongs_to :user
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy


  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

   # いいねしているかどうかの判定
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
