class MarketplacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!

  before_action :link_user, only: :index
  before_action :set_marketplace, only: [:show, :edit, :update, :destroy]

  # GET /marketplaces
  # GET /marketplaces.json
  def index
    @cart= Cart.new

    if current_user.utype == "Seller"
      if @sellers.business_name.blank?
        redirect_to edit_seller_path(@sellers)
      elsif current_user.utype == "Buyer"
       redirect_to edit_customer_path(@customer)
     end
   end

     if params[:o_id].present?
      @carts = Cart.create(customer_id: params[:c_id], offer_id: params[:o_id],seller_id: params[:s_id])
      @offers = Offer.where(:offer_type => "Public").where("quantity > ?",0)
     elsif params[:ntype].present?
      if params[:ntype] == "private"
        @privateoffers = Privateoffer.where(:customer_id => Customer.where(:uid => current_user.id).first.id )
      else
   @offers = Offer.where(:offer_type => "Public").where("quantity > ?",0)
 end
 
  @offers = Offer.all
else
  @offers = Offer.all
 end
  end

  # GET /marketplaces/1
  # GET /marketplaces/1.json
  def show
  end

  # GET /marketplaces/new
  def new
    @marketplace = Marketplace.new
  end

  # GET /marketplaces/1/edit
  def edit
  end

  # POST /marketplaces
  # POST /marketplaces.json
  def create
    
    @marketplace = Cart.create(customer_id: marketplace_params[:customer_id], offer_id: marketplace_params[:offer_id],seller_id: marketplace_params[:seller_id],otype: marketplace_params[:otype])

    respond_to do |format|
      if @marketplace.save
        format.html { redirect_to action: "index" }
        format.json { render :show, status: :created, location: @marketplace }
      else
        format.html { render :new }
        format.json { render json: @marketplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marketplaces/1
  # PATCH/PUT /marketplaces/1.json
  def update
    respond_to do |format|
      if @marketplace.update(marketplace_params)
        format.html { redirect_to @marketplace, notice: 'Marketplace was successfully updated.' }
        format.json { render :show, status: :ok, location: @marketplace }
      else
        format.html { render :edit }
        format.json { render json: @marketplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marketplaces/1
  # DELETE /marketplaces/1.json
  def destroy
    @marketplace.destroy
    respond_to do |format|
      format.html { redirect_to marketplaces_url, notice: 'Marketplace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marketplace
      @marketplace = Marketplace.find(params[:id])
    end

    def link_user


      if (current_user.utype == "Seller")
 @sellers = Seller.where(:seller_email => current_user.email).first_or_create(:seller_email => current_user.email,:uid => current_user.id)
 if @sellers.uid == nil
    @sellers.update_attributes(:uid => current_user.id)
  end
elsif (current_user.utype == "Employee")
  @employee = Employee.where(:email => current_user.email).first
else
  @customer = Customer.where(:buyer_email => current_user.email).first_or_create(:buyer_email => current_user.email,:uid => current_user.id)
  if @customer.uid == nil
    @customer.update_attributes(:uid => current_user.id)
  end
end
     
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marketplace_params
      
      params.permit(:marketplace).permit(:customer_id, :offer_id,:seller_id,:quantity)
    end
end
