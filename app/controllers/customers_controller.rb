class CustomersController < ApplicationController
    skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        session[:customer_id] = @customer.id
        format.html { redirect_to  buyer_steps_path }
        
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        session[:customer_id] = @customer.id
        format.html { redirect_to  buyer_steps_path, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to networks_path, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:business_name, :buyer_type, :code, :status, :account_type, :business_legal_name, :owner, :market_location, :owner_title, :mobile, :buyer_email, :office_phone, :owner_mobile_no, :owner_email, :alternative_contact_name, :alternative_title, :alternative_mobile_number, :fax, :web, :office_address, :shipping_address, :warehouse_address, :billing_address, :logo_for_customer_area, :logo_for_invoices, :approved_by, :member_of_smcs, :smcs_no, :abn_no, :tax_file_no, :other, :certificates, :bank_account_type, :bank_name, :bank_address, :account_name, :account_number, :swift_code, :wire_transfer_code,:uid,:market_drop_off_location,:in_network_of,:credit_limit,:credit_utilized,:credit_available,:credit_due,:credit_type,:Coop_type,:Coop_ref_no,:credit_terms,:coop_credit,:coop_credit_limit,:coop_credit_utilized,:coop_credit_available,:coop_credit_due,:chep_issued,:chep_due,:chep_received,:in_chep_network_of)
    end
end
