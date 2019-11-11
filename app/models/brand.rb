class Brand < ApplicationRecord
  has_many :sellitems
  has_many :buyitems
end
