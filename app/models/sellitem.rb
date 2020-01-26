class Sellitem < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :images, dependent: :destroy
  belongs_to :brand, optional: true
  belongs_to :category, optional: true

  accepts_nested_attributes_for :images, allow_destroy: true
end
