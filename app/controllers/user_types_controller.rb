class UserTypesController < ApplicationController
  before_action :set_user_type, only: [:show, :update, :destroy]

  # GET /user_types
  def index
    @user_types = UserType.all

    render json: @user_types
  end

  # GET /user_types/1
  def show
    render json: @user_type
  end

  # POST /user_types
  def create
    @user_type = UserType.new(user_type_params)

    if @user_type.save
      render json: @user_type, status: :created, location: @user_type
    else
      render json: @user_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_types/1
  def update
    if @user_type.update(user_type_params)
      render json: @user_type
    else
      render json: @user_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_types/1
  def destroy
    @user_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_type
      @user_type = UserType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_type_params
      params.require(:user_type).permit(:type)
    end
end
