class DashboardController < ApplicationController
	  skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
	before_action :authenticate_user!


	def index
		 @seller = Seller.where(:seller_email => current_user.email).first
		@stocks = Stock.where(:seller_id => @seller.id)
		@offers = Offer.where(:seller_id => @seller.id)
		@credits = Credit.all
	end

end
