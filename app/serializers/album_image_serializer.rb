class AlbumImageSerializer < ActiveModel::Serializer
  attributes :id
  has_one :albums
  has_one :images
end
