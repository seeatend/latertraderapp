class OffersController < ApplicationController
    skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @seller = Seller.where(:uid => current_user.id).first
    @offers = Offer.where(:seller_id => @seller.id)
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    
    @seller = Seller.where(:uid => current_user.id).first
    @stock = Stock.where(:seller_id => @seller.id)
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    

    respond_to do |format|
      if @offer.save
        session[:offer_id] = @offer.id
        format.html { redirect_to offer_steps_path }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:stock_id, :sales_man, :allocated_by, :market_price, :selling_price_type, :selling_price, :quantity_type, :size_code, :is_taxable, :enable_negotitation, :visit_store, :total_quantity_on_offer, :min_order_quantity, :start_at, :ends_at, :accepts_offer_below_selling_price, :duration_time, :offer_type, :private_offers, :seller_id,:desc,:order_by, :order_quantity_unit, :net_weight, :packs_per_pellets,:note_to_buyer,:desc)
    end
end
