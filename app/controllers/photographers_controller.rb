class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show, :update, :destroy]

  # GET /photographers
  def index
    @photographers = Photographer.all

    render json: @photographers
  end

  # GET /photographers/1
  def show
    render json: @photographer
  end

  # POST /photographers
  def create
    @photographer = Photographer.new(photographer_params)

    if @photographer.save
      render json: @photographer, status: :created, location: @photographer
    else
      render json: @photographer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photographers/1
  def update
    if @photographer.update(photographer_params)
      render json: @photographer
    else
      render json: @photographer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photographers/1
  def destroy
    @photographer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photographer
      @photographer = Photographer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photographer_params
      params.require(:photographer).permit(:first_name, :last_name)
    end
end
