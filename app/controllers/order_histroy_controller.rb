class OrderHistroyController < ApplicationController
  def index
  	@ordered_item = OrderedItem.find(params[:id])
  	@ordered_items = OrderedItem.where(:order_id => @ordered_item.order_id)
  	@order = Order.find(@ordered_item.order_id)
  end
end
