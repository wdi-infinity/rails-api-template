class AlbumImagesController < ApplicationController
  before_action :set_album_image, only: [:show, :update, :destroy]

  # GET /album_images
  def index
    @album_images = AlbumImage.all

    render json: @album_images
  end

  # GET /album_images/1
  def show
    render json: @album_image
  end

  # POST /album_images
  def create
    @album_image = AlbumImage.new(album_image_params)

    if @album_image.save
      render json: @album_image, status: :created, location: @album_image
    else
      render json: @album_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /album_images/1
  def update
    if @album_image.update(album_image_params)
      render json: @album_image
    else
      render json: @album_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /album_images/1
  def destroy
    @album_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_image
      @album_image = AlbumImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_image_params
      params.require(:album_image).permit(:albums_id, :images_id)
    end
end
