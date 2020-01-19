class Image < ApplicationRecord
  mount_uploader :gazou, ImageUploader
  
  belongs_to :sellitem, optional: true
end
