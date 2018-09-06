class Image < ApplicationRecord
  has_many :album_images
  has_many :albums, through: :album_images
end
