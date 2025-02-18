class PhotosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    if @photo.save
      redirect_to @photo, notice: 'La foto fue subida con éxito.'
    else
      render :new
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: 'La foto fue eliminada con éxito.'
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
