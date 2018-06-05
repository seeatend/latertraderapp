class ApprovalController < ApplicationController

	def index
		@employee = Employee.where(:email => current_user.email).first
		@stocks = Stock.where(:seller_id => @employee.seller_id)
	end
end
