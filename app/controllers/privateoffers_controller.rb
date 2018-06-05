class PrivateoffersController < ApplicationController
  before_action :set_privateoffer, only: [:show, :edit, :update, :destroy]

  # GET /privateoffers
  # GET /privateoffers.json
  def index
    @privateoffers = Privateoffer.all
  end

  # GET /privateoffers/1
  # GET /privateoffers/1.json
  def show
  end

  # GET /privateoffers/new
  def new
    @privateoffer = Privateoffer.new
  end

  # GET /privateoffers/1/edit
  def edit
  end

  # POST /privateoffers
  # POST /privateoffers.json
  def create
    @privateoffer = Privateoffer.new(privateoffer_params)

    respond_to do |format|
      if @privateoffer.save
       
        format.html { redirect_to privateoffers_path, notice: 'Privateoffer was successfully created.' }

        format.json { render :show, status: :created, location: @privateoffer }
      else
        format.html { render :new }
        format.json { render json: @privateoffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privateoffers/1
  # PATCH/PUT /privateoffers/1.json
  def update
    respond_to do |format|
      if @privateoffer.update(privateoffer_params)

        format.html { redirect_to @privateoffer, notice: 'Privateoffer was successfully updated.' }
        format.json { render :show, status: :ok, location: @privateoffer }
      else
        format.html { render :edit }
        format.json { render json: @privateoffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privateoffers/1
  # DELETE /privateoffers/1.json
  def destroy
    @privateoffer.destroy
    respond_to do |format|
      format.html { redirect_to privateoffers_url, notice: 'Privateoffer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privateoffer
      @privateoffer = Privateoffer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def privateoffer_params
      params.require(:privateoffer).permit(:offer_id,:quantity, :customer_id, :seller_id, :offered_price, :status)
    end
end
