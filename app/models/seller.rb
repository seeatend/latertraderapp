class Seller < ActiveRecord::Base
	 has_many :offers
	 has_many :products
	 mount_uploader :logo_for_customer_area, ImageUploader
	 mount_uploader :logo_for_invoices, ImageUploader
end
