class MissingItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_missing_item, only: %i[ show edit update destroy ]

  # GET /missing_items or /missing_items.json
  def index
    @missing_items = MissingItem.all
  end

  # GET /missing_items/1 or /missing_items/1.json
  def show
    @creator = @missing_item.user
  end

  # GET /missing_items/new
  def new
    @missing_item = MissingItem.new
  end

  # GET /missing_items/1/edit
  def edit
  end

  # POST /missing_items or /missing_items.json
  def create
    @missing_item = MissingItem.new(missing_item_params)

    respond_to do |format|
      if @missing_item.save
        format.html { redirect_to missing_item_url(@missing_item), notice: "Missing item was successfully created." }
        format.json { render :show, status: :created, location: @missing_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @missing_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missing_items/1 or /missing_items/1.json
  def update
    respond_to do |format|
      if @missing_item.update(missing_item_params)
        format.html { redirect_to missing_item_url(@missing_item), notice: "Missing item was successfully updated." }
        format.json { render :show, status: :ok, location: @missing_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @missing_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missing_items/1 or /missing_items/1.json
  def destroy
    @missing_item.destroy

    respond_to do |format|
      format.html { redirect_to missing_items_url, notice: "Missing item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_missing_item
      @missing_item = MissingItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def missing_item_params
      params.require(:missing_item).permit(:name, :description, :region, :city, :photo, :user_id)
    end
end
