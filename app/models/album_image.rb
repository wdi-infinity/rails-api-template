class AlbumImage < ApplicationRecord
  belongs_to :album
  belongs_to :image
end
