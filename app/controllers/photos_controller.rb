class PhotosController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @photo = Photo.find(params[:id])
    @missing_item = @photo.missing_item
    @photo.destroy
    flash[:notice] = "Photo Deleted"
    redirect_to edit_missing_item_path(@missing_item)
  end

  def update
    @photo = Photo.find(params[:id])
    @missing_item = @photo.missing_item
    if @photo.update(photos_params)
      flash[:notice] = "Photo Successfully Updated"
      redirect_to edit_missing_item_path(@missing_item)
    else
      flash[:alert] = "Something went wrong during the update process"
      redirect_to edit_missing_item_path(@missing_item)
    end
  end

  def create
    @photo = Photo.new(photos_params)
    @missing_item = MissingItem.find_by(id: params[:photo][:missing_item_id])
    if @photo.save
      flash[:notice] = "Photo was successfully Added"
      redirect_to missing_item_path(@missing_item)
    else
      flash.now[:notice] = "Something went wrong"
      redirect_to missing_item_path(@missing_item)
    end
  end

  private

    def photos_params
      params.require(:photo).permit(:user_id, :missing_item_id, :photo)
    end
end