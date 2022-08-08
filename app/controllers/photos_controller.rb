class PhotosController < ApplicationController
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