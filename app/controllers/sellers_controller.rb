class SellersController < ApplicationController
    skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  before_action :set_seller, only: [:show, :edit, :update, :destroy]

  # GET /sellers
  # GET /sellers.json
  def index
    @sellers = Seller.all
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
  end

  # GET /sellers/new
  def new
    @seller = Seller.new
  end

  # GET /sellers/1/edit
  def edit
  end

  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(seller_params)

    respond_to do |format|
      if @seller.save
         session[:seller_id] = @seller.id
        format.html { redirect_to  seller_steps_path }
        format.json { render :show, status: :created, location: @seller }
      else
        format.html { render :new }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    respond_to do |format|
      if @seller.update(seller_params)
        session[:seller_id] = @seller.id
        format.html { redirect_to  seller_steps_path}
        format.json { render :show, status: :ok, location: @seller }
      else
        format.html { render :edit }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to networks_path, notice: 'Seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:business_name, :seller_type, :code, :status, :account_type, :business_legal_name, :owner, :market_location, :owner_title, :mobile, :seller_email, :office_phone, :owner_mobile_no, :owner_email, :alternative_contact_name, :alternative_title, :alternative_mobile_number, :fax, :web, :office_address, :shipping_address, :warehouse_address, :billing_address, :logo_for_customer_area, :logo_for_invoices, :approved_by, :member_of_smcs, :smcs_no, :abn_no, :tax_file_no, :other, :certificates, :bank_account_type, :bank_name, :bank_address, :account_name, :account_number, :swift_code, :wire_transfer_code,:uid,:market_drop_off_location,:in_network_of,:credit_limit,:credit_utilized,:credit_available,:credit_due,:credit_type,:Coop_type,:Coop_ref_no,:credit_terms,:coop_credit,:coop_credit_limit,:coop_credit_utilized,:coop_credit_available,:coop_credit_due,:chep_issued,:chep_due,:chep_received,:in_chep_network_of,:pincode,:state,:country,:hometown,:BSB)
    end
end
