class MissingItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_missing_item, only: %i[ show edit update destroy, toggle_status ]

  # GET /missing_items or /missing_items.json
  def index
    is_search = params[:search]
    if is_search
      sql = "name LIKE '%#{params[:name]}%'"
      sql = sql + " AND city LIKE '%#{params[:city]}%'" if params[:city].present?
      sql = sql + " AND region LIKE '%#{params[:region]}%'" if params[:region].present?
      sql = sql + " AND is_missing LIKE '%#{params[:is_missing]}%'" if params[:is_missing]
      @missing_items = MissingItem.joins(:photos).where(sql).distinct
      flash[:notice] = "#{@missing_items.size} item(s) Found"
    else
      @missing_items = MissingItem.joins(:photos).distinct
    end
  end

  # GET /missing_items/1 or /missing_items/1.json
  def show
    @creator = @missing_item.user
    @comments = @missing_item.comments
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

  def toggle_status
    if params[:status] == "claimed"
      @missing_item.update(is_missing: false)
      message = "Item missing status updated to claimed"
    else
      message = "Item missing status updated to not claimed"
      @missing_item.update(is_missing: true)
    end
    flash[:notice] = message
    redirect_to @missing_item
  end

  def photos
    @missing_item = MissingItem.find_by(id: params[:id])
    @photos = @missing_item.photos
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
