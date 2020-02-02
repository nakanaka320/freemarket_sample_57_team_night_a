class Category < ApplicationRecord
  has_many :sellitems
  has_many :buyitems
  has_ancestry

end
