class DashboardController < ApplicationController
	  skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
	before_action :authenticate_user!

end
