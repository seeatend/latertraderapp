class B2bOrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  before_action :set_b2b_order, only: [:show, :edit, :update, :destroy]


  # GET /b2b_orders
  # GET /b2b_orders.json
  def index
    @b2b_orders = B2bOrder.all
  end

  # GET /b2b_orders/1
  # GET /b2b_orders/1.json
  def show
  end

  # GET /b2b_orders/new
  def new
    @b2b_order = B2bOrder.new
  end

  # GET /b2b_orders/1/edit
  def edit
  end

  # POST /b2b_orders
  # POST /b2b_orders.json
  def create
    @b2b_order = B2bOrder.new(b2b_order_params)

    respond_to do |format|
      if @b2b_order.save
        format.html { redirect_to @b2b_order, notice: 'B2b order was successfully created.' }
        format.json { render :show, status: :created, location: @b2b_order }
      else
        format.html { render :new }
        format.json { render json: @b2b_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b2b_orders/1
  # PATCH/PUT /b2b_orders/1.json
  def update
    respond_to do |format|
      if @b2b_order.update(b2b_order_params)
        format.html { redirect_to @b2b_order, notice: 'B2b order was successfully updated.' }
        format.json { render :show, status: :ok, location: @b2b_order }
      else
        format.html { render :edit }
        format.json { render json: @b2b_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /b2b_orders/1
  # DELETE /b2b_orders/1.json
  def destroy
    @b2b_order.destroy
    respond_to do |format|
      format.html { redirect_to b2b_orders_url, notice: 'B2b order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b2b_order
      @b2b_order = B2bOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def b2b_order_params
      params.require(:b2b_order).permit(:seller_id, :o_status, :shipping_address, :total_due, :invoice_number, :poi_id, :item_shipped_date, :consignment_number, :transport_contact_name, :transport_contact_number, :item_received_by, :item_received_by_number, :payment_done_date, :payment_confirmed_date, :note_to_buyer, :quantity, :paid_amount, :payment_type, :shipping_type, :drop_off_point, :pick_up_point, :different_drop_location, :different_shipping_location, :packing_done, :packing_done_by, :otype)
    end
end
