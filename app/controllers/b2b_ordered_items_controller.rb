class B2bOrderedItemsController < ApplicationController
  before_action :set_b2b_ordered_item, only: [:show, :edit, :update, :destroy]

  # GET /b2b_ordered_items
  # GET /b2b_ordered_items.json
  def index
    @b2b_ordered_items = B2bOrderedItem.all
  end

  # GET /b2b_ordered_items/1
  # GET /b2b_ordered_items/1.json
  def show
  end

  # GET /b2b_ordered_items/new
  def new
    @b2b_ordered_item = B2bOrderedItem.new
  end

  # GET /b2b_ordered_items/1/edit
  def edit
  end

  # POST /b2b_ordered_items
  # POST /b2b_ordered_items.json
  def create
    @b2b_ordered_item = B2bOrderedItem.new(b2b_ordered_item_params)

    respond_to do |format|
      if @b2b_ordered_item.save
        format.html { redirect_to @b2b_ordered_item, notice: 'B2b ordered item was successfully created.' }
        format.json { render :show, status: :created, location: @b2b_ordered_item }
      else
        format.html { render :new }
        format.json { render json: @b2b_ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b2b_ordered_items/1
  # PATCH/PUT /b2b_ordered_items/1.json
  def update
    respond_to do |format|
      if @b2b_ordered_item.update(b2b_ordered_item_params)
        format.html { redirect_to @b2b_ordered_item, notice: 'B2b ordered item was successfully updated.' }
        format.json { render :show, status: :ok, location: @b2b_ordered_item }
      else
        format.html { render :edit }
        format.json { render json: @b2b_ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /b2b_ordered_items/1
  # DELETE /b2b_ordered_items/1.json
  def destroy
    @b2b_ordered_item.destroy
    respond_to do |format|
      format.html { redirect_to b2b_ordered_items_url, notice: 'B2b ordered item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b2b_ordered_item
      @b2b_ordered_item = B2bOrderedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def b2b_ordered_item_params
      params.require(:b2b_ordered_item).permit(:b2b_order_id, :seller_id, :poi_id, :offer_id, :quantity, :value, :o_status)
    end
end
