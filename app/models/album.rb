class Album < ApplicationRecord
  has_many :album_images
  has_many :images, through: :album_images
end
