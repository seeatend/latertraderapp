class WalkInController < ApplicationController
  def index
  	@orders = Order.where(:otype => "Walk In")
  end
end
