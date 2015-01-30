class PhotosController < ApplicationController

  def index
    # @photos = Photo.all
  end

  def new
    # @photo = Photo.new
    @photo = current_user.photos.new
     @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to users_path, notice: 'Photo uploaded' 
    else
      render :new
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.new
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo = current_photo.destroy
    session.delete(:photo_id)
    redirect_to user_path
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :title)
  end
  
end
