class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    random_invoice = 7.times.map { rand(1..9) }.join.to_i
    @order = Order.new(order_params.merge(:invoice_number=> random_invoice))
    
    respond_to do |format|
      if @order.save
         session[:order_id] = @order.id
        format.html { redirect_to after_order_index_path }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id, :seller_id, :items, :order_approved_date, :shipping_address, :o_status, :total_due, :invoice_number, :item_shipped_date, :consignment_number, :transport_contact_name, :transport_contact_number, :item_received_date, :item_recevied_by_name, :item_received_by_number, :payment_done_date, :payment_confirmed_by, :note_to_buyer, :note_to_seller,:quantity,:shipping_type,:drop_off_point,:pick_up_point,:different_drop_location,:different_shipping_location,:payment_type,:packing_done,:packing_done_by,:otype,:dropoffdateandtime,:pickupdateandtime)
    end
end
