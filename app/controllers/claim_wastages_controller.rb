class ClaimWastagesController < ApplicationController
  before_action :set_claim_wastage, only: [:show, :edit, :update, :destroy]

  # GET /claim_wastages
  # GET /claim_wastages.json
  def index
    @claim_wastages = ClaimWastage.all
  end

  # GET /claim_wastages/1
  # GET /claim_wastages/1.json
  def show
  end

  # GET /claim_wastages/new
  def new
    @claim_wastage = ClaimWastage.new
  end

  # GET /claim_wastages/1/edit
  def edit
  end

  # POST /claim_wastages
  # POST /claim_wastages.json
  def create
    @claim_wastage = ClaimWastage.new(claim_wastage_params)

    respond_to do |format|
      if @claim_wastage.save
        format.html { redirect_to @claim_wastage, notice: 'Claim wastage was successfully created.' }
        format.json { render :show, status: :created, location: @claim_wastage }
      else
        format.html { render :new }
        format.json { render json: @claim_wastage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claim_wastages/1
  # PATCH/PUT /claim_wastages/1.json
  def update
    respond_to do |format|
      if @claim_wastage.update(claim_wastage_params)
        format.html { redirect_to @claim_wastage, notice: 'Claim wastage was successfully updated.' }
        format.json { render :show, status: :ok, location: @claim_wastage }
      else
        format.html { render :edit }
        format.json { render json: @claim_wastage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claim_wastages/1
  # DELETE /claim_wastages/1.json
  def destroy
    @claim_wastage.destroy
    respond_to do |format|
      format.html { redirect_to claim_wastages_url, notice: 'Claim wastage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim_wastage
      @claim_wastage = ClaimWastage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_wastage_params
      params.require(:claim_wastage).permit(:stock_id, :employee_id, :wasted_stock_value, :waste_checking_labour_cost, :total_Waste_claim, :image)
    end
end
