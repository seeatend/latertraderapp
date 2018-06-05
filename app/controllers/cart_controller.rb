class CartController < ApplicationController
    skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!

  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
   @customer = Customer.where(:uid => current_user.id).first
  	@carts = Cart.where(:customer_id => @customer.id)
    @cart = Cart.new
  end

  def new
    @cart = Cart.new
  
  end

  def create
    @cart = Cart.create(cart_params)
    
  end

  def add_to_cart

    params[:cart][:quantity]
    @marketplace = Cart.create(customer_id: params[:cart][:customer_id], offer_id: params[:cart][:offer_id],seller_id: params[:cart][:seller_id],quantity: params[:cart][:quantity],otype: params[:cart][:otype])
    redirect_to action: "index", controller: "marketplaces" 
  end

def checkout  
  @customer = Customer.where(:uid => current_user.id).first
  items = []
    @carts = Cart.where(:customer_id => @customer.id)
 
@carts.each do |cart|
items.push(cart.offer_id)
end
random_invoice = 7.times.map { rand(1..9) }.join.to_i
@orders = Order.create(customer_id: @customer.id,otype: "Marketplace", items: items,o_status: "Order Placed",different_shipping_location: params[:cart][:different_shipping_location],different_drop_location: params[:cart][:different_drop_location],pick_up_point: params[:cart][:pick_up_point],drop_off_point: params[:cart][:drop_off_point], shipping_type: params[:cart][:shipping_type],payment_type: params[:cart][:payment_type],invoice_number: random_invoice,note_to_seller: params[:cart][:note_to_seller],pickupdateandtime: params[:cart][:payment_type],dropoffdateandtime: params[:cart][:dropoffdateandtime])
@carts.each do |cart|

  if cart.otype == "private"
    @privateoffer = Privateoffer.where(:offer_id => cart.offer.id).where(:customer_id => @customer.id).first
    cvalue = cart.quantity * @privateoffer.offered_price
    @ordered_item = OrderedItem.create(order_id: @orders.id,customer_id: cart.customer_id,seller_id: cart.seller_id,offer_id: cart.offer_id,quantity: cart.quantity,value: cvalue )
  else 
@ordered_item = OrderedItem.create(order_id: @orders.id,customer_id: cart.customer_id,seller_id: cart.seller_id,offer_id: cart.offer_id,quantity: cart.quantity,value: (cart.quantity * cart.offer.selling_price) )
end
end

@carts.destroy_all

puts items


end

  def destroy
  	 @cart.destroy
    respond_to do |format|
      format.html { redirect_to cart_index_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

      def category_params
    params.require(:cart).permit(:customer_id, :offer_id,:seller_id,:quantity,:payment_type,:shipping_type,:drop_off_point,:pick_up_point,:different_drop_location,:otype,:different_shipping_location,:dropoffdateandtime,:pickupdateandtime,:note_to_seller)
  end


   
end

