class Sellitem < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :brand
end
