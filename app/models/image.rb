class Image < ApplicationRecord
  mount_uploader :image_name, ImageUploader
  belongs_to :lunch
end
