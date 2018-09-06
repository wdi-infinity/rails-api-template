class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :information, :images
  has_one :user_id, foreign_key: :user_id
  # has_many :images, through: :albums, include_nested_associations: true
  # has_many :images, through: :albums

  def images
    object.images.map do |image|
      custom_image = image.attributes
      custom_image[:photographer] = Photographer.find(image.photographer_id)
      custom_image.delete('photographer_id')
      custom_image
    end
  end
end
