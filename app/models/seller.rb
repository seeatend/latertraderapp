class Seller < ActiveRecord::Base
	 has_many :offers
	 has_many :products
end
