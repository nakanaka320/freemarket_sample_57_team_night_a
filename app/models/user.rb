class User < ApplicationRecord
  has_many :comments ,dependent: :destroy
  has_many :goods ,dependent: :destroy
  has_many :sellitems
  has_many :buyitems
  has_many :addresses
end
