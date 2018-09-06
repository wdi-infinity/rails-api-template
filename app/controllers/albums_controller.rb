class AlbumsController < ProtectedController
  before_action :set_album, only: [:show, :update, :destroy]

  # GET /albums
  def index
    # binding.pry
    @albums = current_user.albums
    # @albums = Album.where(view_user_id: current_user.id)
    # @albums_data = @albums.map do |album|
    #   album_hash = album.attributes
    #   images = AlbumImage.where(album_id: album_hash['id']).map do |album_image|
    #     image = Image.find(album_image['image_id']).attributes
    #     photographer = Photographer.find(image['photographers_id'])
    #     image['photographer_name'] = "#{photographer['first_name']} #{photographer['last_name']}"
    #     image
    #   end
    #   album_hash['images'] = images
    #   album_hash
    # end
    render json: @albums
  end

  # GET /albums/1
  def show
    render json: @album
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:name, :information, :user_id)
    end
end
