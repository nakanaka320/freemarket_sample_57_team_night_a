class Sellitem < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :images, dependent: :destroy
  belongs_to :brand, optional: true
  belongs_to :category, optional: true

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  accepts_nested_attributes_for :images, allow_destroy: true
end
