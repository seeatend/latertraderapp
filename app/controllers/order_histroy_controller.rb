class OrderHistroyController < ApplicationController
  def index
  	if params[:otype] == "shop sales"
  		@order = Order.find(params[:id])
  		@ordered_items = OrderedItem.where(:order_id => @order.id)
  		@ordered_item = @ordered_items.first
  	else
  	@ordered_item = OrderedItem.find(params[:id])
  	@ordered_items = OrderedItem.where(:order_id => @ordered_item.order_id)
  	@order = Order.find(@ordered_item.order_id)
  end
  end
end
