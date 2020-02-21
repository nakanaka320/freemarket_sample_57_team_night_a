class Like < ApplicationRecord
  belongs_to :sellitem
  belongs_to :user
  validates_uniqueness_of :sellitem_id, scope: :user_id
end
