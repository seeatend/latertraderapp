class ChepsController < ApplicationController
  before_action :set_chep, only: [:show, :edit, :update, :destroy]

  # GET /cheps
  # GET /cheps.json
  def index
    @cheps = Chep.all
  end

  # GET /cheps/1
  # GET /cheps/1.json
  def show
  end

  # GET /cheps/new
  def new
    @chep = Chep.new
    @forklift = Forklift.new
  end

  # GET /cheps/1/edit
  def edit
  end

  # POST /cheps
  # POST /cheps.json
  def create
    @chep = Chep.new(chep_params)

    respond_to do |format|
      if @chep.save
        format.html { redirect_to @chep, notice: 'Chep was successfully created.' }
        format.json { render :show, status: :created, location: @chep }
      else
        format.html { render :new }
        format.json { render json: @chep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheps/1
  # PATCH/PUT /cheps/1.json
  def update
    respond_to do |format|
      if @chep.update(chep_params)
        format.html { redirect_to @chep, notice: 'Chep was successfully updated.' }
        format.json { render :show, status: :ok, location: @chep }
      else
        format.html { render :edit }
        format.json { render json: @chep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheps/1
  # DELETE /cheps/1.json
  def destroy
    @chep.destroy
    respond_to do |format|
      format.html { redirect_to cheps_url, notice: 'Chep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chep
      @chep = Chep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chep_params
      params.require(:chep).permit(:customer_id, :order_id, :delivery_date, :chep_issued, :chep_due,:invoice_number,:chep_received)
    end
end
