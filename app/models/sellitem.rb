class Sellitem < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :images, dependent: :destroy
  belongs_to :brand, optional: true
  belongs_to :category, optional: true

  has_many :likes, dependent: :destroy
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(search)
    return Sellitem.all unless search
    Sellitem.where(['name LIKE ?', "%#{search}%"])
  end

  validates_associated :images
  validates :price, numericality: { only_integer: true }
  validates :images, :name, :text, :condition, :send_cost, :send_method, :send_place, :send_day, :category_id, presence: {message: "空欄を埋めてください"}
end
