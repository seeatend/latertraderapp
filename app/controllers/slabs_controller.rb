class SlabsController < ApplicationController
  before_action :set_slab, only: [:show, :edit, :update, :destroy]

  # GET /slabs
  # GET /slabs.json
  def index
    @slabs = Slab.all
  end

  # GET /slabs/1
  # GET /slabs/1.json
  def show
  end

  # GET /slabs/new
  def new
    @slab = Slab.new
  end

  # GET /slabs/1/edit
  def edit
  end

  # POST /slabs
  # POST /slabs.json
  def create
    @slab = Slab.new(slab_params)

    respond_to do |format|
      if @slab.save
        format.html { redirect_to @slab, notice: 'Slab was successfully created.' }
        format.json { render :show, status: :created, location: @slab }
      else
        format.html { render :new }
        format.json { render json: @slab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slabs/1
  # PATCH/PUT /slabs/1.json
  def update
    respond_to do |format|
      if @slab.update(slab_params)
        format.html { redirect_to @slab, notice: 'Slab was successfully updated.' }
        format.json { render :show, status: :ok, location: @slab }
      else
        format.html { render :edit }
        format.json { render json: @slab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slabs/1
  # DELETE /slabs/1.json
  def destroy
    @slab.destroy
    respond_to do |format|
      format.html { redirect_to slabs_url, notice: 'Slab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slab
      @slab = Slab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slab_params
      params.require(:slab).permit(:offer_id, :from_quantity, :to_quantity, :value)
    end
end
