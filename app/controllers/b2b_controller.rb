class B2bController < ApplicationController
  def index
  	if params[:ntype] == "received"
      @product_requests = ProductRequest.where(:seller_id => Seller.where(:seller_email => current_user.email).first.id)
   else
    @product_requests = ProductRequest.where(:poi_id => Seller.where(:seller_email => current_user.email).first.id)
  end
  end
end
