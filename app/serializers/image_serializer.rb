class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :rejected, :note
  # belongs_to :photographer
end
