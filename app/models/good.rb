class Good < ApplicationRecord
  belongs_to :user
  belongs_to :sellitem
  belongs_to :buyitem
end
