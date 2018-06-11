class AfterB2bOrderController < ApplicationController
	include Wicked::Wizard
	steps :additems

def show
	  	@b2border = B2bOrder.find(session[:order_id])
	  	@b2b_ordered_items = B2bOrderedItem.where(:b2b_order_id => @b2border.id)
	  	@b2b_ordered_item = B2bOrderedItem.new

    render_wizard
  end
  
def walk_in_add_items
    puts "It works"
    return true
  end

  def update
  @b2border = B2bOrder.find(session[:order_id])
    @b2border.update(b2b_order_params)
  
  render_wizard @b2border
end

def finish_wizard_path
b2b_orders_path
end

private

 def b2b_order_params
      params.require(:b2b_order).permit(:seller_id, :o_status, :shipping_address, :total_due, :invoice_number, :poi_id, :item_shipped_date, :consignment_number, :transport_contact_name, :transport_contact_number, :item_received_by, :item_received_by_number, :payment_done_date, :payment_confirmed_date, :note_to_buyer, :quantity, :paid_amount, :payment_type, :shipping_type, :drop_off_point, :pick_up_point, :different_drop_location, :different_shipping_location, :packing_done, :packing_done_by, :otype)
    end
end

end
