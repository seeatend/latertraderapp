class AfterB2bOrderController < ApplicationController
	include Wicked::Wizard
	steps :additems
end
