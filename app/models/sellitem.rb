class Sellitem < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :images
  belongs_to :brand, optional: true
  belongs_to :category, optional: true

  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(search)
    return Sellitem.all unless search
    Sellitem.where(['name LIKE ?', "%#{search}%"])
  end
end
