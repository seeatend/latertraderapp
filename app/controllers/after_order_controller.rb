class AfterOrderController < ApplicationController
	include Wicked::Wizard
	steps :additems

def show
	  	@order = Order.find(session[:order_id])
	  	@ordered_items = OrderedItem.where(:order_id => @order.id)
	  	@ordered_item = OrderedItem.new

    render_wizard
  end
  
def walk_in_add_items
    puts "It works"
    return true
  end

  def update
  @order = Order.find(session[:order_id])
   @order.update(order_params)
  
  render_wizard @order
end

def finish_wizard_path
walk_in_index_path
end

private

 def order_params
      params.require(:order).permit(:customer_id, :seller_id, :items, :order_approved_date, :shipping_address, :o_status, :total_due, :invoice_number, :item_shipped_date, :consignment_number, :transport_contact_name, :transport_contact_number, :item_received_date, :item_recevied_by_name, :item_received_by_number, :payment_done_date, :payment_confirmed_by, :note_to_buyer, :note_to_seller,:quantity,:shipping_type,:drop_off_point,:pick_up_point,:different_drop_location,:different_shipping_location,:payment_type,:packing_done,:packing_done_by,:otype)
    end
end
