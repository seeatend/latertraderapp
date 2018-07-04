class Customer < ActiveRecord::Base
	mount_uploader :logo_for_customer_area, ImageUploader
	mount_uploader :logo_for_invoices, ImageUploader
end
