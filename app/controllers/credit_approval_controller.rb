class CreditApprovalController < ApplicationController
  def index
  	 @customers = Customer.all
  end
end
