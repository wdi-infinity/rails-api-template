class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :rejected, :note
  has_one :photographer
end
