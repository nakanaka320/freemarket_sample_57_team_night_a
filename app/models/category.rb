class Category < ApplicationRecord
  has_many :sellitems
  has_many :buyitems
  has_ancestry

  belongs_to :parent, class_name: :Category  
  has_many :children, class_name: :Category, foreign_key: :ancestry
end
